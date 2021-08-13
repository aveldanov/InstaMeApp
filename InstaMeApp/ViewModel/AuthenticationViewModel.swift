//
//  AuthenticationViewModel.swift
//  InstaMeApp
//
//  Created by Anton Veldanov on 8/12/21.
//

import Foundation


struct LoginViewModel{
    var email: String?
    var password: String?
    
    var formIsValid: Bool{
        return email?.isEmpty == false && password?.isEmpty == false
    }
}

struct RegistrationViewModel{
    
    
}
