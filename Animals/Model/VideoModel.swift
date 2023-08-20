//
//  VideoModel.swift
//  Animals
//
//  Created by Aayam Adhikari on 20/08/2023.
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Property to display video thumbnail image
    var thumbnail: String {
        "video-\(self.id)"
    }
}
