//
//  HeaderView.swift
//  Instagram
//
//  Created by Andres Made on 2/18/20.
//  Copyright © 2020 Andres Made. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        Group {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
            
            Text("Photo Sharing")
                .font(.title)
                .padding(.bottom)
            
            Text("The easiest way to share photos with family and friends")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(TextAlignment.center)
        }
    }
}
