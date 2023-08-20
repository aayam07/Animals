//
//  VideoListView.swift
//  Animals
//
//  Created by Aayam Adhikari on 16/08/2023.
//

import SwiftUI

struct VideoListView: View {
    //MARK: - PROPERTIES
    
    // to shuffle the videos in the list, we added @State property wrapper to mutate the videos list and therefore the UI when the value changes
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    // to implement heptics when the shuffle button is tapped
    let hepticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: - BODY
    var body: some View {
        NavigationStack {
            List {
                ForEach(videos) { video in
                    
                    NavigationLink {
                        // Destination View to show when clicked on the label
                        
//                        VideoPlayerView(video: video)
                        
                        VideoPlayerView(videoSelected: video.id, videoTitle: video.name)
                        
                    } label: {
                        // Label for the navigation links
                        VideoListItemView(video: video)
                            .padding(.vertical, 8)
                    }

                }  //: FOR LOOP
            }  //: LIST
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // Action to perform when the button is clicked i.e Shuffle Videos
                        videos.shuffle()
                        
                        // to provide heptic feedback
                        hepticImpact.impactOccurred()
                    } label: {
                        // Button label
                        Image(systemName: "arrow.2.squarepath")
                    }

                }
            }
        }  //: NAVIGATION

    }
}

//MARK: - PREVIEW
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
