//
//  ContentView.swift
//  Animals
//
//  Created by Aayam Adhikari on 16/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {  // to make the dots align at the bottom of each image
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }  //: LIST
            .navigationTitle("Animals")
            .navigationBarTitleDisplayMode(.large)
            .listStyle(PlainListStyle())  // to make the list item cover the entire width of the screen
//            .padding(.vertical, 4)
            
        } //: NAVIGATION
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
