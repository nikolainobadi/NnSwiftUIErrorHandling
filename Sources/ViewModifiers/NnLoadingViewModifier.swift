//
//  NnLoadingViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import SwiftUI

/// A ViewModifier that adds a loading state overlay to the view it modifies.
/// It creates and injects an NnLoadingHandler environment object into the modified view.
/// When the `isLoading` property of NnLoadingHandler is set to true, a loading overlay (ProgressView) is displayed.
struct NnLoadingViewModifier: ViewModifier {
    
    /// The NnLoadingHandler instance to control and observe the loading state.
    @StateObject var loadingHandler = NnLoadingHandler()

    /// Defines the modified content, overlaying a loading state UI when `isLoading` is true.
    func body(content: Content) -> some View {
        ZStack {
            // The original content of the view
            content
                .environmentObject(loadingHandler)
            
            // If the isLoading property of the loadingHandler is true, display a loading overlay
            if loadingHandler.isLoading {
                ZStack {
                    Color.primary
                        .opacity(0.5) // Partially transparent background
                        .ignoresSafeArea() // Fills the entire screen
                    ProgressView() // Spinning progress indicator
                        .progressViewStyle(CircularProgressViewStyle())
                        .accentColor(.white)
                        .scaleEffect(3) // Makes the progress indicator larger
                }
            }
        }
    }
}

public extension View {
    /// Function to add the NnLoadingViewModifier to any View.
    /// Use this to inject the NnLoadingHandler and add the loading state UI to a view.
    func withNnLoadingView() -> some View {
        modifier(NnLoadingViewModifier())
    }
}

