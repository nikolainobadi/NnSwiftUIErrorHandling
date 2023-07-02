//
//  NnAsyncTryButton.swift
//  
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import SwiftUI

public struct NnAsyncTryButton<Label>: View where Label: View {
    @ViewBuilder var label: () -> Label
    @EnvironmentObject var loadingHandler: NnLoadingHandler
    @EnvironmentObject var errorHandler: NnSwiftUIErrorHandler
    
    var role: ButtonRole?
    var action: () async throws -> Void
    
    public init(action: @escaping () async throws -> Void, role: ButtonRole? = nil, label: @escaping () -> Label) {
        self.action = action
        self.role = role
        self.label = label
    }
    
    public var body: some View {
        Button(role: role, action: performAction, label: label)
    }
}


// MARK: - Init
public extension NnAsyncTryButton where Label == Text {
    init(_ titleKey: LocalizedStringKey, role: ButtonRole? = nil, action: @escaping () async throws -> Void) {
        self.init(action: action, role: role, label: { Text(titleKey) })
    }

    init<S>(_ title: S, role: ButtonRole? = nil, action: @escaping () async throws -> Void) where S: StringProtocol {
        self.init(action: action, role: role, label: { Text(title) })
    }
}


// MARK: - Private Methods
private extension NnAsyncTryButton {
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
