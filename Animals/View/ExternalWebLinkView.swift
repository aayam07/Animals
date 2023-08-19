//
//  ExternalWebLinkView.swift
//  Animals
//
//  Created by Aayam Adhikari on 19/08/2023.
//

import SwiftUI

struct ExternalWebLinkView: View {
    
    //MARK: - PROPERTIES
    
    let animal: Animal
    
    //MARK: - BODY
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                
                Spacer()
                
                Group {
                    Link(destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!) {
                        // Label for the Link
                        Text(animal.name)
                    }
                    
                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundColor(.accentColor)
            }  //: HSTACK
        }  //: GROUP BOX
    }
}

//MARK: - PREVIEW

struct ExternalWebLinkView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWebLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
