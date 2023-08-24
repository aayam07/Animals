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
    
    //MARK: - BODY
    var body: some View {
        
        
        
        NavigationView {
            
            // GROUP VIEW IS USED SO THAT THE NAVIGATION BAR AND THE TOOLBAR IS SHARED BETWEEN THE LIST AND THE GRID VIEW
            Group {
                if !isGridViewActive {
                    List {  // to make the dots align at the bottom of each image
                        CoverImageView()
                            .frame(height: 300)
                        
                        
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
                        }  //: FOR LOOP
                    }  //: LIST
                } else {
                    Text("Grid View is active")
                    
                }  //: CONDITION
            } //: GROUP
            .navigationTitle("Animals")
            .navigationBarTitleDisplayMode(.large)
            .listStyle(PlainListStyle())  // to make the list item cover the entire width of the screen
//            .padding(.vertical, 4)
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
                        } label: {
                            Image(systemName: "square.grid.2x2")
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
