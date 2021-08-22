//
//  ImageUploader.swift
//  InstaMeApp
//
//  Created by Anton Veldanov on 8/21/21.
//

import FirebaseStorage
import UIKit

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String)->Void){
        
        guard let imageData = image.jpegData(compressionQuality: 0.75) else {
            return
        }

        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profileImages/\(filename)")
        ref.putData(imageData, metadata: nil) { metadata, error in
            if let error = error{
                debugPrint("Failed to upload image \(error.localizedDescription)")
                return
            }

            ref.downloadURL { url, error in
                guard let imageURL = url?.absoluteString else {
                    return
                }
                completion(imageURL)

            }

        }
    }
}
