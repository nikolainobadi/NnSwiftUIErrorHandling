//
//  AsyncConfirmationDialogueViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 9/3/23.
//

import SwiftUI

struct AsyncConfirmationDialogueViewModifier: ViewModifier {
    @Binding var showingConfirmation: Bool
    
    let buttonText: String
    let message: String
    let action: () async throws -> Void
    
    func body(content: Content) -> some View {
        content
            .confirmationDialog("", isPresented: $showingConfirmation) {
                NnAsyncTryButton(action: action) {
                    Text(buttonText)
                }
            } message: {
                Text(message)
            }
    }
}

public extension View {
    func asyncConfirmation(showingConfirmation: Binding<Bool>, buttonText: String, message: String, action: @escaping () async throws -> Void) -> some View {
        modifier(AsyncConfirmationDialogueViewModifier(showingConfirmation: showingConfirmation, buttonText: buttonText, message: message, action: action))
    }
}
