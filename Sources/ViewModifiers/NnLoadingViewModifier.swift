//
//  NnLoadingViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import SwiftUI

struct NnLoadingViewModifier: ViewModifier {
    @StateObject var loadingHandler = NnLoadingHandler()

    func body(content: Content) -> some View {
        ZStack {
            content
                .environmentObject(loadingHandler)
            
            if loadingHandler.isLoading {
                ZStack {
                    Color.primary
                        .opacity(0.5)
                        .ignoresSafeArea()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .accentColor(.white)
                        .scaleEffect(3)
                }
            }
        }
    }
}

public extension View {
    func withLoadingView() -> some View {
        modifier(NnLoadingViewModifier())
    }
}
