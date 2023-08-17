//
//  CodableBundleExtension.swift
//  Animals
//
//  Created by Aayam Adhikari on 17/08/2023.
//

import Foundation


// Extension to decode a JSON file from the main App Bundle using Swift Generics.
// Genrics: Allows us to write code that is capable of working with a variety of different types. Contains Generic parameter T, which stands for Type word (we can use any word for this parameter). Codable is a constraint to the placeholder of the Generic function as all the JSON file we want to decode must conform to this protocol.

//The advantages of Generic Programming are
//
//Code Reusability
//Avoid Function Overloading
//Once written it can be used for multiple times and cases.

// Here, Generic Type 'T' can be any type (like Int, String, Struct, Class, etc.) that conforms to the Codable Type.

extension Bundle {
    
    func decode<T: Codable>(_ file: String) -> T {
        // 1. Locate the JSON file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        // 2. Create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        // 3. Create a decoder
        let decoder = JSONDecoder()
        
        // 4. Create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        // 5. Return the ready-to-use data
        return loaded  // needs to return Array as our JSON data is inside an Array.
    }
    
}


// NOTE: Use if let if you just want to unwrap some optionals, but prefer guard let if you’re specifically checking that conditions are correct before continuing.
