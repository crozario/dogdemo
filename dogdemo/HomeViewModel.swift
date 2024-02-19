//
//  HomeViewModel.swift
//  dogdemo
//
//  Created by Crossley Rozario on 2/18/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var dogImages = [DogImage]()
    
    init() {
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
}
