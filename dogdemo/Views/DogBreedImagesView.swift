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
            vm.fetchDogBreedImages(breed: dogBreed.breed) { dogImages in
                for image in dogImages {
                    DispatchQueue.main.async {
                        dogBreedImages.append(image)
                    }
                }
            }
        }
    }
}

//#Preview {
//    DogImageView()
//}
