//
//  InsetMapView.swift
//  Animals
//
//  Created by Aayam Adhikari on 19/08/2023.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    //MARK: - PROPERTIES
    
    // define a region for the map to display
    // first parameter defines the latitude and longitude of the center of the Africa continent
    // second parameter defines the Zoom level. Smaller the span value greater the zoom level, in our case the map is zoomed out as the values are greater
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    //MARK: - BODY
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay (
                NavigationLink(destination: {
                    MapView()
                }, label: {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(Color.white)
                            .imageScale(.large)
                        
                        Text("Locations")
                            .foregroundColor(.accentColor)  // will change to desired color in the simulator, not in the preview canvas
                            .fontWeight(.bold)
                        
                    }  //: HSTACK
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(8)
                    )
                })  //: NAVIGATION
                    .padding(12)
                , alignment: .topTrailing  // alignment for the Overlay View
       
            )
            .frame(height: 256)
            .cornerRadius(12)
        
    }
}

//MARK: - PREVIEW
struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
