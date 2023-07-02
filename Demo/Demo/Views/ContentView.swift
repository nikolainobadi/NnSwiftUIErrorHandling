//
//  ContentView.swift
//  Demo
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedRoute: DemoRoute?
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("ErrorHandling Demo")
                    .bold()
                    .font(.title)
                    .minimumScaleFactor(0.5)
                
                ForEach(DemoRoute.allCases) { route in
                    Button(action: { selectedRoute = route }) {
                        Text(route.rawValue)
                    }
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
