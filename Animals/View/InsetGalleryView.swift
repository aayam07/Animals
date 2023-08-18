//
//  InsetGalleryView.swift
//  Animals
//
//  Created by Aayam Adhikari on 18/08/2023.
//

import SwiftUI

struct InsetGalleryView: View {
    
    //MARK: - PROPERTIES
    
    // TO take in contents of individual animals
    let animal: Animal
    
    //MARK: - BODY
    var body: some View {
//        ScrollView(.horizontal, showsIndicators: true) {
//            HStack(spacing: 10) {
////                Referencing initializer 'init(_:content:)' on 'ForEach' requires that 'String' conform to 'Identifiable'. In this situation, you should use id: \.self as the second parameter to your List or ForEach, like this:
//                ForEach(animal.gallery, id: \.self) { galleryImage in
//                    Image(galleryImage)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(height: 200)
//                }
//            }
//        }
        
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { galleryImage in
                    Image(galleryImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }  //: FOR LOOP
            } //: HSTACK
        }  // SCROLL VIEW
    }
}


//MARK: - PREVIEW
struct InsetGalleryView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
