//
//  NnLoadingHandler.swift
//  
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import Foundation

/// A class to handle loading state within SwiftUI.
/// This class is designed to be used as an environment object, providing a `isLoading` state that can be observed by views.
/// It is especially useful in conjunction with the `NnAsyncTryButton` which starts and stops loading state while handling async throws methods.
public final class NnLoadingHandler: ObservableObject {
    
    /// Published variable to hold the loading state. Views can observe this and react when it changes.
    @Published var isLoading: Bool = false
    
    /// Function to start loading. Sets `isLoading` to true.
    public func startLoading() {
        isLoading = true
    }
    
    /// Function to stop loading. Sets `isLoading` to false.
    public func stopLoading() {
        isLoading = false
    }
}

