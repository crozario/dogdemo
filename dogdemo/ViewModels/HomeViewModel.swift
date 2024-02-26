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
    
    let dogImageService = DogImageService()
    
    init() {
        self.fetchDogBreedNames()
        self.fetchRandomDogImage(count: 50)
    }
    
    func fetchDogBreedNames() {
        dogImageService.fetchDogBreedNames { [weak self] result in
            switch result {
            case .success(let dogBreeds):
                DispatchQueue.main.async {
                    self?.dogBreeds = dogBreeds
                }
            case . failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchRandomDogImage(count: Int) {
        dogImageService.fetchRandomDogImage(count: count) { [weak self] result in
            switch result {
            case .success(let dogImages):
                DispatchQueue.main.async {
                    self?.dogImages = dogImages
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchDogBreedImages(breed: String, completionHandler: @escaping (Result<[DogImage], Error>) -> Void) {
        dogImageService.fetchDogBreedImages(breed: breed) { result in
            switch result {
            case .success(let dogImages):
                completionHandler(.success(dogImages))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
