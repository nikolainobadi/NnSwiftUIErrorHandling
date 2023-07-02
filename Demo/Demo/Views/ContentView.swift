//
//  ContentView.swift
//  Demo
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import SwiftUI
import NnSwiftUIErrorHandling // only for preview

struct ContentView: View {
    @State private var path = [DemoRoute]()
    
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
                            .font(.headline)
                            .frame(width: 200)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
                Spacer()
            }
            .navigationDestination(for: DemoRoute.self) { route in
                route
                    .navigationTitle(route.rawValue)
            }
        }
    }
}


// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .withLoadingView()
            .withErrorHandling()
    }
}
