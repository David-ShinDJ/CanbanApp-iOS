//
//  CanvanAppIosApp.swift
//  CanvanAppIos
//
//  Created by David_ADA on 2022/09/28.
//

import SwiftUI

@main
struct CanvanAppIosApp: App {
    @StateObject var contentViewModel:ContentViewModel = ContentViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(contentViewModel)
        }
    }
}
