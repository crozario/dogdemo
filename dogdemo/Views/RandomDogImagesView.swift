//
//  RandomDogImagesView.swift
//  dogdemo
//
//  Created by Crossley Rozario on 2/20/24.
//

import SwiftUI

struct RandomDogImagesView: View {
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        NavigationView {
            DogImageShowcaseView(dogImages: vm.dogImages)
            .navigationTitle("Random Dogs")
        }
    }
}

