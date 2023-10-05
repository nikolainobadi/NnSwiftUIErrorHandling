//
//  NnTryButton.swift
//  
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import SwiftUI

/// A SwiftUI button that handles errors thrown by its action.
/// The error is handled by the NnSwiftUIErrorHandler injected as an environment object.
public struct NnTryButton<Label>: View where Label: View {
    
    /// ViewBuilder for the button's label.
    @ViewBuilder var label: () -> Label
    
    /// Environment object to handle errors thrown by the action.
    @EnvironmentObject var errorHandler: NnSwiftUIErrorHandler
    
    /// Role of the button, e.g., .cancel or .destructive.
    var role: NnButtonRole?
    
    /// Action that can throw errors. Any error thrown will be handled by the `errorHandler`.
    var action: () throws -> Void
    
    /// Initializer for the button. Takes an action that can throw errors, an optional role, and a label.
    public init(action: @escaping () throws -> Void, role: NnButtonRole? = nil, label: @escaping () -> Label) {
        self.action = action
        self.role = role
        self.label = label
    }
    
    /// The body of the button. Calls `performAction` when the button is tapped.
    public var body: some View {
        if #available(iOS 15.0, *) {
            Button(role: role?.buttonRole, action: performAction, label: label)
        } else {
            Button(action: performAction, label: label)
        }
    }
}


// MARK: - Init
public extension NnTryButton where Label == Text {
    
    /// Convenience initializer for when the button's label is a `LocalizedStringKey`.
    init(_ titleKey: LocalizedStringKey, role: NnButtonRole? = nil, action: @escaping () throws -> Void) {
        self.init(action: action, role: role, label: { Text(titleKey) })
    }

    /// Convenience initializer for when the button's label is a `String`.
    init<S>(_ title: S, role: NnButtonRole? = nil, action: @escaping () throws -> Void) where S: StringProtocol {
        self.init(action: action, role: role, label: { Text(title) })
    }
}


// MARK: - Private Methods
private extension NnTryButton {
    
    /// Function to perform the action and handle any thrown error.
    func performAction() {
        do {
            try action()  // Perform the action
        } catch {
            errorHandler.handle(error: error)  // Handle any thrown error
        }
    }
}
