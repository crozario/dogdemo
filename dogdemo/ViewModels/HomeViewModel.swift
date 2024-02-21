//
//  HomeViewModel.swift
//  dogdemo
//
//  Created by Crossley Rozario on 2/18/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var dogImages = [DogImage]()
    @Published var dogBreeds = [DogBreed]()
    
    init() {
        self.fetchDogBreeds()
        self.fetchRandomDogImage(count: 10)
    }
    
    func fetchRandomDogImage(count: Int) {
        guard let url = URL(string: "https://dog.ceo/api/breeds/image/random/\(count)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(DogImages.self, from: data)
                    
                    for imageURL in result.imageURLs {
                        print(imageURL)
                        if let url = URL(string: imageURL) {
                            DispatchQueue.main.async {
                                self.dogImages.append(DogImage(id: UUID(), url: url))
                            }
                        }
                    }
                } catch {
                    print("Error decoding json: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }.resume()
    }
    
    func fetchDogBreeds() {
        guard let url = URL(string: "https://dog.ceo/api/breeds/list/all") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(DogBreeds.self, from: data)
                    
                    for breed in result.breeds {
                        DispatchQueue.main.async {
                            self.dogBreeds.append(DogBreed(breed: breed.key, subBreeds: breed.value))
                        }
                    }
                } catch {
                    print("error decoding json \(error)")
                }
            } else if let error = error {
                print("error fetching data: \(error)")
            }
            
        }.resume()
    }
}
