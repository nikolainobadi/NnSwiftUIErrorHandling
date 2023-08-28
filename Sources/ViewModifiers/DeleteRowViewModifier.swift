//
//  DeleteRowViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 8/27/23.
//

import SwiftUI

public struct DeleteRowViewModifier: ViewModifier {
    @State private var showingConfirmation = false
    
    let message: String
    let isActive: Bool
    let delete: () async throws -> Void
    
    public func body(content: Content) -> some View {
        if isActive {
            content
                .swipeActions {
                    Button(action: { showingConfirmation = true }) {
                        Image(systemName: "trash")
                    }
                    .tint(.red)
                }
                .confirmationDialog("", isPresented: $showingConfirmation) {
                    NnAsyncTryButton(action: delete, role: .destructive) {
                        Text("Delete")
                    }
                } message: {
                    Text(message)
                }
        } else {
            content
        }
    }
}

public extension View {
    func withSwipeDelete(message: String = "Are you sure you want to delete this item?", isActive: Bool = true, delete: @escaping () async throws -> Void) -> some View {
        modifier(DeleteRowViewModifier(message: message, isActive: isActive, delete: delete))
    }
}

