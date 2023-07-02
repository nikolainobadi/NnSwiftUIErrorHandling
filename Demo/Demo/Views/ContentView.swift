//
//  ContentView.swift
//  Demo
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("ErrorHandling Demo")
                    .bold()
                    .font(.title)
                    .minimumScaleFactor(0.5)
                
                Spacer()
                ForEach(DemoRoute.allCases) { route in
                    Button(action: { path.append(route) }) {
                        Text(route.rawValue)
                    }
                }
                Spacer()
            }
            .navigationDestination(for: DemoRoute.self, destination: { $0 })
        }
    }
}

import NnSwiftUIErrorHandling

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .withLoadingView()
            .withErrorHandling()
    }
}
