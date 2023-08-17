//
//  CoverImageView.swift
//  Animals
//
//  Created by Aayam Adhikari on 17/08/2023.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: - PROPERTIES
    
    // for actual cover images
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    //MARK: - BODY
    var body: some View {
        TabView {
            ForEach(coverImages) { coverImage in
                Image(coverImage.name)
                    .resizable()
                    .scaledToFill()  // to make the images touch horizontal edges when using the fixed height frame in the Content View, we use scaledToFill
            }  //: FOR LOOP
            
        }  //: TAB VIEW
        .tabViewStyle(PageTabViewStyle())  // shows little dots at the bottom
    }
}

//MARK: - PREVIEW
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
