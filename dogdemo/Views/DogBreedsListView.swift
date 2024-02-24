//
//  SwiftUIView.swift
//  dogdemo
//
//  Created by Crossley Rozario on 2/20/24.
//

import SwiftUI

struct DogBreedsListView: View {
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.dogBreeds, id: \.breed) { dogBreed in
                    NavigationLink {
                        DogBreedImagesView(dogBreed: dogBreed)
                    } label: {
                        Text(dogBreed.breed)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("Breeds")
        }
    }
}

//#Preview {
//    DogBreedsListView()
//}
