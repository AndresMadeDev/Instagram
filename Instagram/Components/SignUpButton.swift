//
//  SignUpButton.swift
//  Instagram
//
//  Created by Andres Made on 3/8/20.
//  Copyright © 2020 Andres Made. All rights reserved.
//

import SwiftUI



struct SignUnButton: View {
    
    var action: () -> Void
    var label: String
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(label)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            }
        }.modifier(SignInButtonModifier())
    }
}
