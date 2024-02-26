//
//  DogImageShowcaseView.swift
//  dogdemo
//
//  Created by Crossley Rozario on 2/23/24.
//

import SwiftUI

struct DogImageShowcaseView: View {
    let dogImages: [DogImage]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: 100, maximum: 200), spacing: 10)
            ], spacing: 10) {
                ForEach(dogImages, id: \.id) { dogImage in
                    AsyncImage(url: dogImage.url) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                .clipped()
                                .cornerRadius(10)
                        case .failure:
                            ZStack {
                                Color.gray
                                Text("Failed To Load")
                            }
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .clipped()
                            .cornerRadius(10)
                        case .empty:
                            ZStack {
                                ProgressView()
                                    .foregroundStyle(.white)
                            }
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .clipped()
                            .cornerRadius(10)
                        @unknown default:
                            ZStack {
                                Color.gray
                                Text("Unknown Failure")
                            }
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .clipped()
                            .cornerRadius(10)
                        }
                    }
                }
            }
            .padding(10)
        }
    }
}


//#Preview {
//    DogImageShowcaseView()
//}
