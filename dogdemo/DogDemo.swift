//
//  dogdemoApp.swift
//  dogdemo
//
//  Created by Crossley Rozario on 2/18/24.
//

import SwiftUI

@main
struct DogDemo: App {
    @StateObject var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(vm)
        }
    }
}
