//
//  VideoPlayerView.swift
//  Animals
//
//  Created by Aayam Adhikari on 20/08/2023.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    //MARK: - PROPERTIES
    
    var videoSelected: String
    var videoTitle: String
    
    //MARK: - BODY
    var body: some View {
        
        // to play a single video file from the app's bundle with SwiftUI
        // playVideo() is a utility function in Utilities folder
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
                
                // ADD ONs to the Video Player View (Like Watermark)
//                Text(videoTitle)
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
//                    .padding(.bottom, 30)
//                    .padding(.horizontal)
                , alignment: .topLeading
            )
            
        }  //: VSTACK
//        .accentColor(.accentColor)
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//MARK: - PREVIEW
struct VideoPlayerView_Previews: PreviewProvider {
    
//    static let videos: [Video] = Bundle.main.decode("videos.json")
    
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }
//        VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
    }
}
