//
//  MapView.swift
//  Animals
//
//  Created by Aayam Adhikari on 16/08/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    //MARK: - PROPERTIES
    
    // USING SWIFT CLOSURE
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()  // CLOSURE
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    //MARK: - BODY
    var body: some View {
        //MARK: - 1. BASIC MAP
//        Map(coordinateRegion: $region)
        
        //MARK: - 2. MAP WITH ANNOTATIONS (ADVANCED MAP)
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            
            // (A) PIN: OLD STYLE (always static i.e. no user interaction)
//            MapPin(coordinate: item.location, tint: .accentColor)  // depricated in iOS 16
            
            // (B) MARKER: NEW STYLE (always static i.e. no user interaction)
//            MapMarker(coordinate: item.location, tint: .accentColor)
            
            // (C) CUSTOM BASIC ANNOTATION (it could be interactive)
            MapAnnotation(coordinate: item.location, content: {
                // SwiftUI view to display as an Annotation
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .center)
            })
            
        })
    }
}

//MARK: - PREVIEWS
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
