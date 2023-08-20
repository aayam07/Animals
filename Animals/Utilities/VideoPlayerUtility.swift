//
//  VideoPlayerUtility.swift
//  Animals
//
//  Created by Aayam Adhikari on 20/08/2023.
//

import Foundation
import AVKit

// this is the utility (or helper) to help auto play the animal video file
// such small functionalities are kept in utilities (or Helper) folder

// create a new AudioVideo Player
var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    
//    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
//        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)  // since we have checked for valid file name and extension, we can safely force unwrap the Bundle url
//        videoPlayer?.play()  // to play the video automatically
//    }
    
    if let safeUrl = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
        videoPlayer = AVPlayer(url: safeUrl)
        videoPlayer?.play()  // to play the video file automatically
        
    }
    
    return videoPlayer!
}


