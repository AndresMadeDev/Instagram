//
//  UserNameTextField.swift
//  Instagram
//
//  Created by Andres Made on 3/8/20.
//  Copyright © 2020 Andres Made. All rights reserved.
//

import SwiftUI

struct UserNameTextField: View {
     @Binding var userName: String
       
       var body: some View {
           HStack {
               Image(systemName: "person.fill")
                   .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.15))
               TextField("User Name", text: $userName)
           }.modifier(TextfieldModifire())
       }
}


