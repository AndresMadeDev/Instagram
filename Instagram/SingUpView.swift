//
//  SingUpView.swift
//  Instagram
//
//  Created by Andres Made on 3/8/20.
//  Copyright © 2020 Andres Made. All rights reserved.
//

import SwiftUI

struct SingUpView: View {
    
    @State var userName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Image("user-placeholder")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .padding(.bottom, 50)
            
            UserNameTextField(userName: $userName)
            EmailTextField(email: $email)
            VStack(alignment: .leading) {
                PasswordTextField(password: $password)
                Text("At least 8 characters required")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.leading)
            }
            SignUnButton(action: {}, label: "Sign Up")
            Divider()
            Text("An account will allow you to save and access photo information across devices.  You can delete your account at any time and your information will not be shared")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding()
                .lineLimit(nil)
            
        }
    }
}

struct SingUpView_Previews: PreviewProvider {
    static var previews: some View {
        SingUpView()
    }
}
