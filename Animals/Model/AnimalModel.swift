//
//  AnimalModel.swift
//  Animals
//
//  Created by Aayam Adhikari on 17/08/2023.
//

import SwiftUI

// Parsing JSON data

struct Animal: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
