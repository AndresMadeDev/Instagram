//
//  StorageService.swift
//  Instagram
//
//  Created by Andres Made on 3/14/20.
//  Copyright © 2020 Andres Made. All rights reserved.
//

import Foundation
import Firebase

class StorageService {
    
    static func saveAvatar(userId: String, username: String, email: String,imageData: Data, metadata: StorageMetadata, storageAvatarRef: StorageReference, onSuccess: @escaping(_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        
        storageAvatarRef.putData(imageData, metadata: metadata) { (storageMetadata, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            
            storageAvatarRef.downloadURL { (url, err) in
                if let metaImageUrl = url?.absoluteString {
                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest(){
                        changeRequest.photoURL = url
                        changeRequest.displayName = username
                        changeRequest.commitChanges { (error) in
                            if error != nil {
                                onError(error!.localizedDescription)
                                return
                            }
                        }
                    }
                    let firesstoreRoot = Firestore.firestore()
                    let firestoreUsers = firesstoreRoot.collection("users")
                    let firestoreUserId = firestoreUsers.document(userId)
                    //                        let userInfor = ["username": self.userName, "email": self.email, "profileImageUrl": metaImageUrl]
                    let user = User.init(uid: userId, email: email, profileImage: metaImageUrl, username: username, bio: "", keywords: [])
                    guard let dict = try? user.toDictionay() else {return}
                    
//                    guard let decoderUser = try? User.init(fromDictionary: dict) else {return}
//                    print(decoderUser.username)
                    firestoreUserId.setData(dict)
                    firestoreUserId.setData(dict) { (error) in
                        if error != nil {
                            onError(error!.localizedDescription)
                            return
                        }
                        onSuccess(user)
                    }
                    
                }
            }
        }
    }
}
