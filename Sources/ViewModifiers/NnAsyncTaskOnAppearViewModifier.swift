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
    
    /// The async action that will be performed in the .task block of the view, which can potentially throw an error.
    let asyncAction: () async throws -> Void
    
    /// The body of the ViewModifier. It modifies the content view to include a .task block that performs the async action when the view appears.
    /// It starts the loading state, performs the async action, handles any thrown error, and stops the loading state.
    func body(content: Content) -> some View {
        content
            .task {
                loadingHandler.startLoading()
                
                do {
                    try await asyncAction()
                } catch {
                    errorHandler.handle(error: error)
                }
                
                loadingHandler.stopLoading()
            }
    }
}

@available(iOS 15.0, *)
public extension View {
    /// Applies the NnAsyncTaskOnAppearViewModifier to a view.
    /// It enables the view to perform a given async action in a .task block when the view appears, with built-in loading state and error handling.
    func asyncTask(_ asyncAction: @escaping () async throws -> Void) -> some View {
        modifier(NnAsyncTaskOnAppearViewModifier(asyncAction: asyncAction))
    }
}
