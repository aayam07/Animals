//
//  MapInfoPanelView.swift
//  Animals
//
//  Created by Aayam Adhikari on 21/08/2023.
//

import SwiftUI

struct MapInfoPanelView: View {
    //MARK: - PROPERTIES
    
    var regionCenterLatitude: Double
    var regionCenterLongitude: Double
    
    //MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 12, content: {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            
            VStack(alignment: .leading, spacing: 3) {
                HStack {
                    Text("Latitude:")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                    
                    Spacer()
                    
                    Text("\(regionCenterLatitude)")
                        .font(.footnote)
                        .foregroundColor(.white)
                }
                
                Divider()
                
                HStack {
                    Text("Longitude:")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                    
                    Spacer()
                    
                    Text("\(regionCenterLongitude)")
                        .font(.footnote)
                        .foregroundColor(.white)
                }
            }
        })  //: HSTACK
    }
}

//MARK: - PREVIEW
struct MapInfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        MapInfoPanelView(regionCenterLatitude: 6.600286, regionCenterLongitude: 16.4377599)
    }
}
