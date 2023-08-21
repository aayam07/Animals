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
    
    // USING SWIFT CLOSURE TO PREPARE MAP REGION TO DISPLAY
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()  // CLOSURE
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // to provide animation to the infoPannel
    @State private var isInfoPannelVisible: Bool = false
    
    //MARK: - BODY
    var body: some View {
        //MARK: - 1. BASIC MAP
//        Map(coordinateRegion: $region)
        
        //MARK: - 2. MAP WITH ANNOTATIONS (ADVANCED MAP)
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            
            // (A) PIN: OLD STYLE (always static i.e. no user interaction)
//            MapPin(coordinate: item.locationCoordinates, tint: .accentColor)  // depricated in iOS 16
            
            // (B) MARKER: NEW STYLE (always static i.e. no user interaction)
//            MapMarker(coordinate: item.locationCoordinates, tint: .accentColor)
            
            // (C) CUSTOM BASIC ANNOTATION (it could be interactive)
//            MapAnnotation(coordinate: item.locationCoordinates, content: {
//                // SwiftUI view to display as an Annotation
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            })  //: ANNOTATION
            
            
            // (D) CUSTOM COMPLEX ANNOTATION (it could be interactive)
            MapAnnotation(coordinate: item.locationCoordinates, content: {
                MapAnnotationView(location: item)  // item is a NationalParkLocation object
            })
            
        })  //: MAP
        .overlay(
            
            MapInfoPanelView(regionCenterLatitude: region.center.latitude, regionCenterLongitude: region.center.longitude)
//                .padding()  // provides padding to the content i.e background
                .padding(.vertical, 12) // provides padding to the content i.e background
                .padding(.horizontal, 16) // provides padding to the content i.e background
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding()  // provides padding to the outside the whole HStack
                .opacity(isInfoPannelVisible ? 1 : 0)
            , alignment: .top
        )
        .onAppear {
            withAnimation(.linear(duration: 0.5)) {
                isInfoPannelVisible = true
            }
        }
    }
}

//MARK: - PREVIEWS
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
