//
//  InsetFactView.swift
//  Animals
//
//  Created by Aayam Adhikari on 19/08/2023.
//

import SwiftUI

struct InsetFactView: View {
    //MARK: - PROPERTIES
    let animal: Animal
    
    //MARK: - BODY
    var body: some View {
        GroupBox {
            TabView {
                // as facts don't have id, we use its name as its unique identifier with the 2nd parameter of the for loop below
                ForEach(animal.fact, id:\.self) { fact in
                    Text(fact)
                }
                
            }  //: TAB VIEW
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)  // the ideal size isn't fixed. For many predefined Views the ideal dimensions define how much space the View needs to be understood. For Text() the ideal width is the length of the string and the ideal height is the line's height.
            
        }  //: GROUP BOX
    }
}

//MARK: - PREVIEW
struct InsetFactView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
