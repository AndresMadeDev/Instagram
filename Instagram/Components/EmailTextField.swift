//
//  EmailTextField.swift
//  Instagram
//
//  Created by Andres Made on 2/18/20.
//  Copyright © 2020 Andres Made. All rights reserved.
//

import SwiftUI

struct EmailTextField: View {
    
    @Binding var email: String
    
    var body: some View {
        HStack {
            Image(systemName: "envelope.fill")
                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.15))
            TextField("Email", text: $email)
        }.modifier(TextfieldModifire())
    }
}
