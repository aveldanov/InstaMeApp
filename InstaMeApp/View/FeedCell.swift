//
//  FeedCell.swift
//  InstaMeApp
//
//  Created by Anton Veldanov on 8/10/21.
//

import UIKit


class FeedCell: UICollectionViewCell {
     //MARK: Properties
    
    private let profileImageView: UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.isUserInteractionEnabled = true
        profileImageView.image = #imageLiteral(resourceName: "venom-7")
        return profileImageView
    }()
    
    private let userNameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Venom", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        // 'lazy var' because we are adding the target, if not lazy hen we need to move target to INIT
        // because Target is addded before it is initilized
        button.addTarget(self, action: #selector(didTapUserName), for: .touchUpInside)
        return button
    }()
    
    private let postImageView: UIImageView = {
        let postImageView = UIImageView()
        postImageView.contentMode = .scaleAspectFill
        postImageView.clipsToBounds = true
        postImageView.isUserInteractionEnabled = true
        postImageView.image = #imageLiteral(resourceName: "venom-7")
        return postImageView
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "like_unselected"), for: .normal)
        button.tintColor = .black
        return button
        
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "comment"), for: .normal)
        button.tintColor = .black
        return button
        
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "send2"), for: .normal)
        button.tintColor = .black
        return button
        
    }()
    
    private let likeLabel: UILabel = {
        
        
        
    }()
    
    
     //MARK: Lifecycle
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor,
                                left: leftAnchor,
                                paddingTop: 12,
                                paddingLeft: 12)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40/2
        
        addSubview(userNameButton)
        userNameButton.centerY(inView: profileImageView,
                               leftAnchor: profileImageView.rightAnchor,
                               paddingLeft: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
     //MARK: Actions
    
    
    @objc func didTapUserName(){
        
        print("DEBUG: Did tap userName")
        
    }
    
    
}
