//
//  NnAsyncOpenURLViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 9/1/23.
//

import SwiftUI

/// A SwiftUI ViewModifier that allows for handling async throws methods in an .onOpenURL block of a SwiftUI view.
/// The ViewModifier uses `NnLoadingHandler` and `NnSwiftUIErrorHandler` as environment objects to handle loading state and error state respectively.
struct NnAsyncOpenURLViewModifier: ViewModifier {
    
    /// The loading state handler. It controls the presentation of a loading state UI.
    @EnvironmentObject var loadingHandler: NnLoadingHandler
    
    /// The error handler. It processes any thrown errors and controls the presentation of error messages.
    @EnvironmentObject var errorHandler: NnSwiftUIErrorHandler
    
    /// The async action that will be performed in the .task block of the view, which can potentially throw an error.
    let asyncAction: (URL) async throws -> Void
    
    /// The body of the ViewModifier. It modifies the content view to include a .task block that performs the async action when the view appears.
    /// It starts the loading state, performs the async action, handles any thrown error, and stops the loading state.
    func body(content: Content) -> some View {
        content
            .onOpenURL(perform: { url in
                Task {
                    loadingHandler.startLoading()
                    
                    do {
                        try await asyncAction(url)
                    } catch {
                        errorHandler.handle(error: error)
                    }
                    
                    loadingHandler.stopLoading()
                }
            })
    }
}

public extension View {
    /// Applies the NnAsyncTaskOnAppearViewModifier to a view.
    /// It enables the view to perform a given async action in a .task block when the view appears, with built-in loading state and error handling.
    func asyncHandleURL(_ asyncAction: @escaping (URL) async throws -> Void) -> some View {
        modifier(NnAsyncOpenURLViewModifier(asyncAction: asyncAction))
    }
}

