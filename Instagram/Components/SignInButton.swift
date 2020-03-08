//
//  SignInButton.swift
//  Instagram
//
//  Created by Andres Made on 2/18/20.
//  Copyright © 2020 Andres Made. All rights reserved.
//

import SwiftUI

struct SignInButton: View {
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            HStack {
                Spacer()
                Text("Sign In")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            }
        }.padding()
            .background(Color.primary)
            .cornerRadius(5)
            .shadow(radius: 10, x: 0, y: 10)
            .padding()
    }
}
