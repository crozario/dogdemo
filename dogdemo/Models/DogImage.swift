//
//  DogImage.swift
//  dogdemo
//
//  Created by Crossley Rozario on 2/18/24.
//

import Foundation

struct DogImage {
    let id: UUID
    let url: URL
}

struct DogImages: Codable {
    let imageURLs: [String]
    
    enum CodingKeys: String, CodingKey {
        case imageURLs = "message"
    }
}
