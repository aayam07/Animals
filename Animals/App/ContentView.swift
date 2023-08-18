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
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
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

                }
            }  //: LIST
            .navigationTitle("Animals")
            .navigationBarTitleDisplayMode(.large)
            .listStyle(PlainListStyle())  // to make the list item cover the entire width of the screen
//            .padding(.vertical, 4)
            
           
            
        } //: NAVIGATION
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
