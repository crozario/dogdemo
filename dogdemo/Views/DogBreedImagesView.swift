//
//  DogImageView.swift
//  dogdemo
//
//  Created by Crossley Rozario on 2/20/24.
//

import SwiftUI

struct DogBreedImagesView: View {
    @EnvironmentObject private var vm: HomeViewModel
    
    let dogBreed: DogBreed
    @State private var dogBreedImages = [DogImage]()
    
    var body: some View {
        DogImageShowcaseView(dogImages: dogBreedImages)
        .navigationTitle(dogBreed.breed)
        .onAppear {
            vm.fetchDogBreedImages(breed: dogBreed.breed) { result in
                switch result {
                case .success(let dogImages):
                    DispatchQueue.main.async {
                        self.dogBreedImages = dogImages
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

//#Preview {
//    DogImageView()
//}
