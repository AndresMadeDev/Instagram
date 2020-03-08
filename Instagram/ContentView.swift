//
//  ContentView.swift
//  Instagram
//
//  Created by Andres Made on 2/18/20.
//  Copyright © 2020 Andres Made. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        VStack {
            Spacer()
            HeaderView()
            Spacer()
            Divider()
            EmailTextField(email: $email)
            PasswordTextField(password: $password)
            SignInButton()
            Divider()
            SignUpView()            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}










