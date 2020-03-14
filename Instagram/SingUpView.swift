//
//  SingUpView.swift
//  Instagram
//
//  Created by Andres Made on 3/8/20.
//  Copyright © 2020 Andres Made. All rights reserved.
//

import SwiftUI


struct SingUpView: View {

     @ObservedObject var signupViewModel = SignupViewModel()
    
    func signup(){
       
        signupViewModel.signup(username: signupViewModel.username, email: signupViewModel.email, password: signupViewModel.password, imageData: signupViewModel.imageData, completed: { (user) in
            print(user.email)
            self.clean()
        }) { (errorMessage) in
            print("Error \(errorMessage)")
            self.signupViewModel.showAlert = true
            self.signupViewModel.errorString = errorMessage
            self.clean()
        }
    }
    
    func clean(){
        self.signupViewModel.username = ""
        self.signupViewModel.email = ""
        self.signupViewModel.password = ""
    }
    
    var body: some View {
        VStack {
            signupViewModel.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .padding(.bottom, 80)
                .onTapGesture {
                    self.signupViewModel.showImagePicker = true
            }
            
            UserNameTextField(userName: $signupViewModel.username)
            EmailTextField(email: $signupViewModel.email)
            VStack(alignment: .leading) {
                PasswordTextField(password: $signupViewModel.password)
                    
                Text("At least 8 charaters are requierd")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding([.leading])
            }
            SignUnButton(action: signup, label: "Sign Up").alert(isPresented: $signupViewModel.showAlert){
                Alert(title: Text("Error"), message: Text(self.signupViewModel.errorString), dismissButton: .default(Text("Ok")))
            }
            Divider()
            Text("An account will allow you to save and access photo information across devices.  You can delete your account at any time and your information will not be shared.")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding()
                .lineLimit(nil)
            
        }.sheet(isPresented: $signupViewModel.showImagePicker){
            ImagePicker(showImagePicker: self.$signupViewModel.showImagePicker, pickedImage: self.$signupViewModel.image, imageData: self.$signupViewModel.imageData)
        }
        .navigationBarTitle("Register", displayMode: .inline)
    }
}

struct SingUpView_Previews: PreviewProvider {
    static var previews: some View {
        SingUpView()
    }
}
