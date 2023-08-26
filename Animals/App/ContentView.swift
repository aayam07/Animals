//
//  ContentView.swift
//  Animals
//
//  Created by Aayam Adhikari on 16/08/2023.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    let hepticFeedback = UIImpactFeedbackGenerator(style: .medium)
    
    // to track the content view grid layout
    @State private var isGridViewActive: Bool = false
    
//    // for a two column grid layout
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    // FOR DYNAMIC GRID LAYOUT (Starts with 1 column grid layout)
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1  // to keep track of the number of columns of the next grid layout
    @State private var toolbarIcon: String = "square.grid.2x2"  // shows the next grid layout icon in the grid cycle when the user taps on the toolbar icon
    
    
    //MARK: - FUNCTIONS
    // function to call when the user taps on the grid button each time
    func gridSwitch() {
        
        withAnimation(.spring()) {
            gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)  // to show two column grid layout on the first tap of the grid toolbar button (main mathematical calculation)
        }
        
        
        gridColumn = gridLayout.count  // next grid column value to show
        print("Grid Number: \(gridColumn)")
        
        // TOOLBAR IMAGE
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        
        case 2:
            toolbarIcon = "square.grid.3x2"
            
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
            
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    
    //MARK: - BODY
    var body: some View {
        
        NavigationView {
            
            // GROUP VIEW IS USED SO THAT THE NAVIGATION BAR AND THE TOOLBAR IS SHARED BETWEEN THE LIST AND THE GRID VIEW
            Group {
                if !isGridViewActive {
                    List {  // to make the dots align at the bottom of each image
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        
                        ForEach(animals) { animal in
                            
                            NavigationLink {
                                // Navigation link Destination to show when the user clicks on a list item
                                AnimalDetailView(animal: animal)
                                
                            } label: {
                                
                                // Navigation link Label to show list items
                                AnimalListItemView(animal: animal)
                                    .padding(.vertical, 4)
                            }
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            .padding()
                        }  //: FOR LOOP
                        
                        // CREDIT VIEW
                        CreditsView()
                            .modifier(CenterModifier())  // Custom Modifier to solve the alignment issue in the list cell(row)
                        
                    }  //: LIST
                    .listStyle(PlainListStyle())  // to make the list item cover the entire width of the screen
//                    .padding(.vertical, 4)
                    
                    
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, content: {
                            ForEach(animals) { animal in
                                
                                NavigationLink {
                                    AnimalDetailView(animal: animal)
                                } label: {
                                    AnimalGridItemView(animal: animal)
                                }  //: NAVIGATION LINK
                                
                            }  //: FOR LOOP
                        })  //: VERTICAL GRID
                        .padding(10)
                        
                    }  //: SCROLL VIEW
                }  //: CONDITION
            } //: GROUP
            .navigationTitle("Animals")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    // HSTACK is treated as a single view (item)
                    HStack (spacing: 16) {
                        
                        // LIST
                        Button {
                            // ACTION TO PERFORM
                            print("List View is Activated")
                            isGridViewActive = false
                            hepticFeedback.impactOccurred()
                        } label: {
                            // LABEL FOR THE BUTTON
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        // GRID
                        Button {
                            print("Grid view is activated")
                            isGridViewActive = true
                            hepticFeedback.impactOccurred()
                            gridSwitch()
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
   
                    }  //: HSTACK
                }  //: TOOLBAR BUTTONS
            }  //: TOOLBAR
            
        } //: NAVIGATION
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
