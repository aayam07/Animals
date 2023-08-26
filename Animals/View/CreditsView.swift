//
//  CreditsView.swift
//  Animals
//
//  Created by Aayam Adhikari on 26/08/2023.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            
            Text("""
    Copyright © Aayam Adhikari
    All Rights Reserved.
    Made with 💛 using SwiftUI.
    """)
            .font(.footnote)
        .multilineTextAlignment(.center)
        }  //: VSTACK
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
