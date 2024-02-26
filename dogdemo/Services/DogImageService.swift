//
//  DogImageService.swift
//  dogdemo
//
//  Created by Crossley Rozario on 2/25/24.
//

import Foundation

class DogImageService {
    func fetchRandomDogImage(count: Int, completionHandler: @escaping (Result<[DogImage], Error>) -> Void) {
        guard let url = URL(string: "https://dog.ceo/api/breeds/image/random/\(count)") else {
            return
        }
        
        var dogImages = [DogImage]()
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(DogImages.self, from: data)
                    
                    for imageURL in result.imageURLs {
                        if let url = URL(string: imageURL) {
                            dogImages.append(DogImage(id: UUID(), url: url))
                        }
                    }
                    
                    completionHandler(.success(dogImages))
                } catch {
                    completionHandler(.failure(error))
                }
            } else if let error = error {
                completionHandler(.failure(error))
            }
        }.resume()
    }
    
    func fetchDogBreedNames(completionHandler: @escaping (Result<[DogBreed], Error>) -> Void) {
        guard let url = URL(string: "https://dog.ceo/api/breeds/list/all") else {
            return
        }
        
        var dogBreeds = [DogBreed]()
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(DogBreeds.self, from: data)
                    
                    for breed in result.breeds {
                        dogBreeds.append(DogBreed(breed: breed.key, subBreeds: breed.value))
                    }
                    
                    completionHandler(.success(dogBreeds))
                    
                } catch {
                    completionHandler(.failure(error))
                }
            } else if let error = error {
                completionHandler(.failure(error))
            }
            
        }.resume()
    }
    
    func fetchDogBreedImages(breed: String, completionHandler: @escaping (Result<[DogImage], Error>) -> Void) {
        var dogImages = [DogImage]()
        
        guard let url = URL(string: "https://dog.ceo/api/breed/\(breed)/images") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(DogImages.self, from: data)
                    
                    for url in result.imageURLs {
                        if let url = URL(string: url) {
                            dogImages.append(DogImage(id: UUID(), url: url))
                        }
                    }
                    completionHandler(.success(dogImages))
                } catch {
                    completionHandler(.failure(error))
                }
            }
        }.resume()
    }
}
