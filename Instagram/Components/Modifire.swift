//
//  Modifire.swift
//  Instagram
//
//  Created by Andres Made on 3/8/20.
//  Copyright © 2020 Andres Made. All rights reserved.
//

import SwiftUI

struct TextfieldModifire: ViewModifier {
    func body (content: Content) -> some View{
        content.padding()
        .border(Color_Light_Grey, width: 1)
        .padding([.leading, .trailing, .top])
    }
   
}

struct SignInButtonModifier: ViewModifier {
    func body(content: Content) -> some View{
        content.padding()
        .background(Color.primary)
        .cornerRadius(5)
        .shadow(radius: 10, x: 0, y: 10)
        .padding()
    }
}


