//
//  NnAsyncTaskOnAppearViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import SwiftUI

/// A SwiftUI ViewModifier that allows for handling async throws methods in a .task block of a SwiftUI view.
/// The ViewModifier uses `NnLoadingHandler` and `NnSwiftUIErrorHandler` as environment objects to handle loading state and error state respectively.
@available(iOS 15.0, *)
struct NnAsyncTaskOnAppearViewModifier: ViewModifier {
    
    /// The loading state handler. It controls the presentation of a loading state UI.
    @EnvironmentObject var loadingHandler: NnLoadingHandler
    
    /// The error handler. It processes any thrown errors and controls the presentation of error messages.
    @EnvironmentObject var errorHandler: NnSwiftUIErrorHandler
    
    let hideLoadingIndicator: Bool
    let asyncAction: () async throws -> Void
    
    private func configureLoading(startLoading: Bool) {
        if hideLoadingIndicator { return }
        
        if startLoading {
            loadingHandler.startLoading()
        } else {
            loadingHandler.stopLoading()
        }
    }
    
    /// The body of the ViewModifier. It modifies the content view to include a .task block that performs the async action when the view appears.
    /// It starts the loading state, performs the async action, handles any thrown error, and stops the loading state.
    func body(content: Content) -> some View {
        content
            .task {
                configureLoading(startLoading: true)
                
                do {
                    try await asyncAction()
                } catch {
                    errorHandler.handle(error: error)
                }
                
                configureLoading(startLoading: false)
            }
    }
}

@available(iOS 15.0, *)
public extension View {
    /// Applies the NnAsyncTaskOnAppearViewModifier to a view.
    /// It enables the view to perform a given async action in a .task block when the view appears, with built-in loading state and error handling.
    func asyncTask(hideLoadingIndicator: Bool = false, asyncAction: @escaping () async throws -> Void) -> some View {
        modifier(NnAsyncTaskOnAppearViewModifier(hideLoadingIndicator: hideLoadingIndicator, asyncAction: asyncAction))
    }
}
