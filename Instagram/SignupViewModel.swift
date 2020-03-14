//
//  SignupViewModel.swift
//  Instagram
//
//  Created by Andres Made on 3/13/20.
//  Copyright © 2020 Andres Made. All rights reserved.
//

import SwiftUI
import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage

class SignupViewModel: ObservableObject {
    var username: String = ""
    var email: String = ""
    var password: String = ""
    var errorString = ""
    var image: Image = Image("user-placeholder")
    var imageData: Data = Data()
    @Published var showAlert: Bool = false
    @Published var showImagePicker: Bool = false
    
    
    func signup(username: String, email: String, password: String, imageData: Data, completed: @escaping(_ user: User) -> Void, onError: @escaping(_ errorMessage: String) -> Void){
        
        if !username.isEmpty && !password.isEmpty && !email.isEmpty && !imageData.isEmpty{
            AuthService.signupUser(username: username, email: email, password: password, imageData: imageData, onSuccess: completed, onError: onError)
        } else {
            showAlert = true
            errorString = "Please fill in all fields"
        }
        
        
    }
}

