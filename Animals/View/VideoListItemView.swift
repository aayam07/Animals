//
//  VideoListItemView.swift
//  Animals
//
//  Created by Aayam Adhikari on 20/08/2023.
//

import SwiftUI

struct VideoListItemView: View {
    //MARK: - PROPERTIES
    
    let video: Video
    
    //MARK: - BODY
    var body: some View {
        
        HStack(alignment: .center, spacing: 10) {
            
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(9)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }  //: ZSTACK
            
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }  //: VSTACK
            
        }  //: HSTACK
        
        
        
//        HStack(alignment: .center, spacing: 16) {
//            Image("video-lion")
//                .resizable()
//                .scaledToFill()
//                .frame(width: 90, height: 90)
//                .clipShape(
//                    RoundedRectangle(cornerRadius: 12)
//                )
//                .overlay(
//                    Image(systemName: "play.fill")
//                        .imageScale(.large)
//                )
//
//            VStack(alignment: .leading, spacing: 8) {
//                Text("Lion")
//                    .font(.title2)
//                    .fontWeight(.bold)
//                    .multilineTextAlignment(.leading)
//
//                Text("sdkjahdkjhdkjsahdkjhsdkhaskdjhaskjdhskjdhkshdkjshdkskdhskdhksadhksahdksahdkshdkahdks")
//                    .font(.footnote)
//                    .lineLimit(2)
//                    .multilineTextAlignment(.leading)
//                    .padding(.trailing, 8)
//
//            }
//
//        }
    }
}

//MARK: - PREVIEW
struct VideoListItemView_Previews: PreviewProvider {

//    In Swift, static keyword is used to define or create type-level properties and method that only belongs to the class itself rather than to its instances. Or we can say that we can directly access the static properties and methods of a class with help of class itself instead of creating the instance of the class.
    
    static let videos: [Video] = Bundle.main.decode("videos.json")
    
    static var previews: some View {
        
        VideoListItemView(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
