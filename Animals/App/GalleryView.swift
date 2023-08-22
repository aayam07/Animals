//
//  GalleryView.swift
//  Animals
//
//  Created by Aayam Adhikari on 16/08/2023.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
        }  //: SCROLL
//        .frame(width: .infinity, height: .infinity)
        .background(
            MotionAnimationView()
        )
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
