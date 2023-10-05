//
//  NnAsyncTryButton.swift
//  
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import SwiftUI

/// A SwiftUI button component specifically designed for performing async actions that can throw errors.
/// This button uses `NnLoadingHandler` and `NnSwiftUIErrorHandler` as environment objects to handle loading state and error state respectively.
public struct NnAsyncTryButton<Label>: View where Label: View {
    
    /// View builder for the button's label view.
    @ViewBuilder var label: () -> Label
    
    /// The loading state handler. It controls the presentation of a loading state UI.
    @EnvironmentObject var loadingHandler: NnLoadingHandler
    
    /// The error handler. It processes any thrown errors and controls the presentation of error messages.
    @EnvironmentObject var errorHandler: NnSwiftUIErrorHandler
    
    /// An optional role for the button, such as a destructive action or a confirmation action.
    var role: NnButtonRole?
    
    /// The async action that the button will perform, which can potentially throw an error.
    var action: () async throws -> Void
    
    /// Initializes a new NnAsyncTryButton with a given async action, role, and label.
    public init(action: @escaping () async throws -> Void, role: NnButtonRole? = nil, label: @escaping () -> Label) {
        self.action = action
        self.role = role
        self.label = label
    }
    
    /// The view body for the NnAsyncTryButton. A standard Button view is returned, performing the async action when tapped.
    public var body: some View {
        if #available(iOS 15.0, *) {
            Button(role: role?.buttonRole, action: performAction, label: label)
        } else {
            Button(action: performAction, label: label)
        }
    }
}


// MARK: - Init
public extension NnAsyncTryButton where Label == Text {
    /// Initializes a new NnAsyncTryButton with a given localized title key, role, and async action.
    init(_ titleKey: LocalizedStringKey, role: NnButtonRole? = nil, action: @escaping () async throws -> Void) {
        self.init(action: action, role: role, label: { Text(titleKey) })
    }

    /// Initializes a new NnAsyncTryButton with a given title string, role, and async action.
    init<S>(_ title: S, role: NnButtonRole? = nil, action: @escaping () async throws -> Void) where S: StringProtocol {
        self.init(action: action, role: role, label: { Text(title) })
    }
}


// MARK: - Private Methods
private extension NnAsyncTryButton {
    /// Performs the async action when the button is tapped.
    /// It begins by triggering the loading state, then attempts the async action.
    /// If the action throws an error, the error is passed to the errorHandler.
    /// Whether the action succeeds or fails, the loading state is ended afterward.
    func performAction() {
        loadingHandler.startLoading()
        
        Task {
            do {
                try await action()
            } catch {
                errorHandler.handle(error: error)
            }
            
            loadingHandler.stopLoading()
        }
    }
}
