//
//  AsyncConfirmationDialogueViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 9/3/23.
//

import SwiftUI

@available(iOS 15.0, *)
struct AsyncConfirmationDialogueViewModifier: ViewModifier {
    @Binding var showingConfirmation: Bool
    
    let role: ButtonRole?
    let buttonText: String
    let message: String
    let action: () async throws -> Void
    
    func body(content: Content) -> some View {
        content
            .confirmationDialog("", isPresented: $showingConfirmation) {
                NnAsyncTryButton(action: action, role: role?.nnButtonRole) {
                    Text(buttonText)
                }
            } message: {
                Text(message)
            }
    }
}


@available(iOS 15.0, *)
public extension View {
    func asyncConfirmation(showingConfirmation: Binding<Bool>, role: ButtonRole? = nil, buttonText: String, message: String, action: @escaping () async throws -> Void) -> some View {
        modifier(AsyncConfirmationDialogueViewModifier(showingConfirmation: showingConfirmation, role: role, buttonText: buttonText, message: message, action: action))
    }
}


@available(iOS 15.0, *)
internal extension ButtonRole {
    var nnButtonRole: NnButtonRole? {
        switch self {
        case .cancel:
            return .cancel
        case .destructive:
            return .destructive
        default:
            return nil
        }
    }
}
