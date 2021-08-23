//
//  RegistrationController.swift
//  InstaMeApp
//
//  Created by Anton Veldanov on 8/10/21.
//

import UIKit

class RegistrationController: UIViewController{
    
    //MARK: Properties
    
    private var registrationViewModel = RegistrationViewModel()
    
    private var profileImage: UIImage?
    
    
    private let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleProfilePhotoSelect), for: .touchUpInside )
        return button
    }()
    
    private let emailTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Email")
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    
    private let passwordTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let fullNameTextField: UITextField = CustomTextField(placeholder: "Fullname")
    
    
    private let userNameTextField: UITextField = CustomTextField(placeholder: "Username")
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        button.layer.cornerRadius = 5
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    private let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Already have an account?", secondPart: "Login")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
         return button
    }()
    
    //MARK: Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

        configureUI()
        configureNotificationObservers()
    }
    
    
     //MARK: Actions
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @objc func handleSignUp(){
        guard let email = emailTextField.text else {
            return
        }
        guard let password = passwordTextField.text else {
            return
        }
        guard let fullname = fullNameTextField.text else {
            return
        }
        guard let username = userNameTextField.text else {
            return
        }
        guard let profileImage = profileImage else {
            return
        }
        
        let credentials = AuthCredentials(email: email,
                                          password: password,
                                          fullname: fullname,
                                          username: username,
                                          profileImage: profileImage)
        
        AuthService.registerUser(withCredentials: credentials)
        
    }
    
    
    
    
    @objc func handleShowLogin(){
        navigationController?.popViewController(animated: true)
    }
    
    
    
    @objc func textDidChange(sender: UITextField){
        if sender == emailTextField{
            registrationViewModel.email = sender.text
        }else if sender == passwordTextField{
            registrationViewModel.password = sender.text
        }else if sender == fullNameTextField{
            registrationViewModel.fullname = sender.text
        }else{
            registrationViewModel.username = sender.text
        }
        updateForm()
    }
    
    
    @objc func handleProfilePhotoSelect(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    
     //MARK: Helpers
    
    func configureUI(){
        configureGradientLayer()
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.setDimensions(height: 140, width: 140)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField,
                                                   passwordTextField,
                                                   fullNameTextField,
                                                   userNameTextField,
                                                   signUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.anchor(top: plusPhotoButton.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 32,
                     paddingLeft: 32,
                     paddingRight: 32)
        
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
        
    }

    func configureNotificationObservers(){
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        fullNameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        userNameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    
}


//MARK: FormViewModel

extension RegistrationController: FormViewModelProtocol{
   func updateForm() {
       signUpButton.backgroundColor = registrationViewModel.buttonBackgroundColor
       signUpButton.setTitleColor(registrationViewModel.buttonTitleColor, for: .normal)
       signUpButton.isEnabled = registrationViewModel.formIsValid
   }
}

// MARK: UIImagePickerControllerDelegate

extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else {
            return
        }
        profileImage = selectedImage
        
        // rounding the button itself
        plusPhotoButton.layer.cornerRadius = plusPhotoButton.frame.width/2
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.layer.borderWidth = 2
        plusPhotoButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        self.dismiss(animated: true, completion: nil)
    }


}

//
//extension RegistrationController {
//    func hideKeyboardWhenTappedAround() {
//        let tapGesture = UITapGestureRecognizer(target: self,
//                         action: #selector(hideKeyboard))
//        view.addGestureRecognizer(tapGesture)
//    }
//
//    @objc func hideKeyboard() {
//        view.endEditing(true)
//    }
//}
