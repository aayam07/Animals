//
//  AnimalDetailView.swift
//  Animals
//
//  Created by Aayam Adhikari on 18/08/2023.
//

import SwiftUI

struct AnimalDetailView: View {
    
    //MARK: - PROPERTIES
    let animal: Animal
    
    //MARK: - BODY
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                
                // HERO IMAGE (COVER IMAGE)
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                    .padding(.vertical)
                
                // TITLE
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
//                    .underline(color: .accentColor)
                    .background(
                        // In SwiftUI Color is a view. So, we can add modifiers to it as with the other views
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)

                    )
                    
                // HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // GALLERY
                
                // to avoid limitation of using multiple views in a SwiftUI file, we can use group to include multiple views inside it. Group will be considered as a single view then.
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                // FACTS
                
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                // DESCRIPTION
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)  // higher priority. A parent layout offers the child views with the highest layout priority all the space offered to the parent minus the minimum space required for all its lower-priority children.
                }
                .padding(.horizontal)
                
                // MAP
                
                Group {
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    
                    InsetMapView()
                }
                .padding(.horizontal)
                
                
                // LINK
                
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    
                    ExternalWebLinkView(animal: animal)
                    
                }
                .padding(.horizontal)
       
            }  //: VSTACK
            .navigationTitle("Learn about \(animal.name)")  // to always show the navigation title when the detail view shows up
            .navigationBarTitleDisplayMode(.inline)
        
    }  //: SCROLL VIEW
    }
}

//MARK: - PREVIEW
struct AnimalDetailView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {  // to show navigation Title in the preview
            AnimalDetailView(animal: animals[0])
        }
    }
}
