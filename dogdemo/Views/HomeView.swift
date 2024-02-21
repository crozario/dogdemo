//
//  ContentView.swift
//  dogdemo
//
//  Created by Crossley Rozario on 2/18/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            RandomDogImagesView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
            
            DogBreedsListView()
                .tabItem {
                    VStack {
                        Image(systemName: "dog")
                        Text("Breeds")
                    }
                }
            
        }
    }
}



#Preview {
    HomeView()
}
