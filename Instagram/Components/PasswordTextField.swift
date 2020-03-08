//
//  PasswordTextField.swift
//  Instagram
//
//  Created by Andres Made on 2/18/20.
//  Copyright © 2020 Andres Made. All rights reserved.
//

import SwiftUI

struct PasswordTextField: View {
    
    @Binding var password: String
    
    var body: some View {
        HStack {
            Image(systemName: "lock.fill")
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.15))
            SecureField("password", text: $password)
        }.padding()
            .border(Color(red: 0, green: 0, blue: 0, opacity: 0.15), width: 1)
            .padding([.leading, .trailing, .top])
    }
}
