//
//  HeadingView.swift
//  Animals
//
//  Created by Aayam Adhikari on 18/08/2023.
//

import SwiftUI


// REUSABLE SUBTITLE VIEW
struct HeadingView: View {
    //MARK: - PROPERTIES
    
    var headingImage: String
    var headingText: String
    
    //MARK: - BODY
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }  //: HSTACK
        .padding(.vertical)
    }
}

//MARK: - PREVIEW
struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
