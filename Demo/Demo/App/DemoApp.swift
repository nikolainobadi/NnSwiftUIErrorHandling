//
//  DemoApp.swift
//  Demo
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import SwiftUI
import NnSwiftUIErrorHandling

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .withLoadingView()
                .withErrorHandling()
        }
    }
}
