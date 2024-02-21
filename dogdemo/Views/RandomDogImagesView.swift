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
            List {
                ForEach(vm.dogImages, id: \.id)  { dogImage in
                    HStack {
                        Spacer()
                        AsyncImage(url: dogImage.url) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                    .border(Color.blue, width: 2)
                            case .failure:
                                ZStack {
                                    Color.pink
                                    Text("Loading Failed!")
                                        .foregroundStyle(.white)
                                }
                                .frame(width: 200, height: 200)
                            case .empty:
                                ZStack {
                                    ProgressView()
                                        .foregroundStyle(.white)
                                }
                                .frame(width: 200, height: 200)
                            @unknown default:
                                ZStack {
                                    Color.pink
                                    Text("Unknown Failure")
                                }
                                .frame(width: 200, height: 200)
                            }
                        }
                        Spacer()
                    }
                }
            }
            .navigationTitle("Random Dogs")
        }
    }
}
