//
//  CenterModifier.swift
//  Animals
//
//  Created by Aayam Adhikari on 26/08/2023.
//

import SwiftUI

// CUSTOM VIEW MODIFIER

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        
        // Centers any content inside a view using two Spacers
        HStack {
            Spacer()
            content  // View to which this modifier is applied to is placed here when we call this struct
            Spacer()
        }
    }
    
    
}
