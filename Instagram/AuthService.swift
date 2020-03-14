//
//  AuthService.swift
//  Instagram
//
//  Created by Andres Made on 3/13/20.
//  Copyright © 2020 Andres Made. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage

class AuthService{
    static func signupUser(username: String, email: String, password: String, imageData: Data, onSuccess: @escaping(_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void){
        //        Firebase.createAccount(userName: userName, email: email, password: password, imageData: imageData)
        
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
            if error != nil {
                print(error!.localizedDescription)
                onError(error!.localizedDescription)
                return
            }
            guard let userId = authData?.user.uid else { return }
            let storageRoot = Storage.storage().reference(forURL: "gs://swiftui-instagram-4f697.appspot.com")
            let storageAvatar = storageRoot.child("avatar")
            let storageAvatarUserId = storageAvatar.child(userId)
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpg"

            StorageService.saveAvatar(userId: userId, username: username, email: email, imageData: imageData, metadata: metadata, storageAvatarRef: storageAvatarUserId, onSuccess: onSuccess, onError: onError)
        }
    }
}
