//
//  AuthService.swift
//  InstaMeApp
//
//  Created by Anton Veldanov on 8/21/21.
//

import UIKit
import Firebase

struct AuthCredentials{
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
    
}

struct AuthService{
    
    static func registerUser(withCredentials credentials: AuthCredentials){
        print("DEBUG Credentials \(credentials)")
    }
}
