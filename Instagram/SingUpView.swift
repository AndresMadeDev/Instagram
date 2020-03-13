//
//  SingUpView.swift
//  Instagram
//
//  Created by Andres Made on 3/8/20.
//  Copyright © 2020 Andres Made. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseStorage

struct SingUpView: View {
    
    @State var userName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var showImagePicker: Bool = false
    @State var image: Image = Image("user-placeholder")
    @State var imageData: Data = Data()
    
    
    
    func signUP(){
//        Firebase.createAccount(userName: userName, email: email, password: password, imageData: imageData)
        
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
            if error != nil {
                return
            }
            guard let userId = authData?.user.uid else { return }
            let storageRoot = Storage.storage().reference(forURL: "gs://swiftui-instagram-4f697.appspot.com")
            let storageAvatar = storageRoot.child("avatar")
            let storageAvatarUserId = storageAvatar.child(userId)
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpg"
            
            storageAvatarUserId.putData(self.imageData, metadata: metadata) { (storageMetadata, error) in
                if error != nil {
                    return
                }
                
                storageAvatarUserId.downloadURL { (url, err) in
                    if let metaImageUrl = url?.absoluteString {
                        if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest(){
                            changeRequest.photoURL = url
                            changeRequest.displayName = self.userName
                            changeRequest.commitChanges { (error) in
                                if error != nil {
                                    return
                                }
                            }
                        }
                        let firesstoreRoot = Firestore.firestore()
                        let firestoreUsers = firesstoreRoot.collection("users")
                        let firestoreUserId = firestoreUsers.document(userId)
                        let userInfor = ["username": self.userName, "email": self.email, "profileImageUrl": metaImageUrl]
                        
                        firestoreUserId.setData(userInfor)
                        
                    }
                }
            }
        }
        
    }
    
    var body: some View {
        VStack {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .padding(.bottom, 80)
                .onTapGesture {
                    self.showImagePicker = true
            }
            
            UserNameTextField(userName: $userName)
            EmailTextField(email: $email)
            VStack(alignment: .leading) {
                PasswordTextField(password: $password)
                    
                Text("At least 8 charaters are requierd")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding([.leading])
            }
            SignUnButton(action: signUP, label: "Sign Up")
            Divider()
            Text("An account will allow you to save and access photo information across devices.  You can delete your account at any time and your information will not be shared.")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding()
                .lineLimit(nil)
            
        }.sheet(isPresented: $showImagePicker){
            ImagePicker(showImagePicker: self.$showImagePicker, pickedImage: self.$image, imageData: self.$imageData)
        }
        .navigationBarTitle("Register", displayMode: .inline)
    }
}

struct SingUpView_Previews: PreviewProvider {
    static var previews: some View {
        SingUpView()
    }
}
