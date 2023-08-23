//
//  GalleryView.swift
//  Animals
//
//  Created by Aayam Adhikari on 16/08/2023.
//

import SwiftUI

struct GalleryView: View {
    
    //MARK: - PROPERTIES
    
    // to store the necessary information about the selected animal image
    @State private var selectedAnimal: String = "lion"
    
    // for the Animal Photos
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    // to create heptic feedback when the user taps on an image
    let hepticFeedback = UIImpactFeedbackGenerator(style: .medium)
    
    
    //SIMPLE GRID DEFINITION
    // FOR 3 COLUMN GRID LAYOUT
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())  // single flexible grid cell size
//    ]
    
    // EFFICIENT GRID DEFINITION
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // DYNAMIC GRID LAYOUT
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0  // no of columns inside a grid
    
    
    // function to switch the number of columns in the Grid Layout (by default 3 items when the view appears). Used to provide Slider feature
    func gridSwitch() {
        
        // to provide animation when the slider changes the grid layout
        withAnimation(.spring()) {
            gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
        }
        
    }
    
    
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            
            VStack(alignment: .center, spacing: 30) {
                
                //MARK: - IMAGE FOR THE SELECTED GRID PHOTO
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                
                //MARK: - SLIDER
                
                // shows either 2 or 3 or 4 columns by changing the grid column value. 3 means slider in the middle
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: { newValue in
                        
                        // newValue can be sent the parameter for gridSwitch() as its gridColumn value
                        gridSwitch()
                    })
                
                
                //MARK: - GRID (LazyVGrid View)
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay (
                                Circle()
                                    .stroke(Color.white, lineWidth: 1)
                            )
                            .onTapGesture {
                                selectedAnimal = animal.image
                                hepticFeedback.impactOccurred()
                            }
                    }  //: FOR LOOP
                    
                }  //: GRID
//                .animation(.easeIn, value: gridLayout)
                .onAppear {
                    gridSwitch()
                }
                
            }  //: VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
            
        }  //: SCROLL
//        .frame(width: .infinity, height: .infinity)
        .background(
            MotionAnimationView()
        )
    }
}

//MARK: - PREVIEW
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
