//
//  DogBreeds.swift
//  dogdemo
//
//  Created by Crossley Rozario on 2/20/24.
//

import Foundation

struct DogBreed {
    let breed: String
    let subBreeds: [String]?
}

struct DogBreeds: Decodable {
    let breeds: [String : [String]?]
    
    enum CodingKeys: String, CodingKey {
        case breeds = "message"
    }
}
