//
//  NnTryButton.swift
//  
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import SwiftUI

public struct NnTryButton<Label>: View where Label: View {
    @ViewBuilder var label: () -> Label
    @EnvironmentObject var errorHandler: NnSwiftUIErrorHandler
    
    var role: ButtonRole?
    var action: () throws -> Void
    
    public init(action: @escaping () throws -> Void, role: ButtonRole? = nil, label: @escaping () -> Label) {
        self.action = action
        self.role = role
        self.label = label
    }
    
    public var body: some View {
        Button(role: role, action: performAction, label: label)
    }
}


// MARK: - Init
public extension NnTryButton where Label == Text {
    init(_ titleKey: LocalizedStringKey, role: ButtonRole? = nil, action: @escaping () throws -> Void) {
        self.init(action: action, role: role, label: { Text(titleKey) })
    }

    init<S>(_ title: S, role: ButtonRole? = nil, action: @escaping () throws -> Void) where S: StringProtocol {
        self.init(action: action, role: role, label: { Text(title) })
    }
}


// MARK: - Private Methods
private extension NnTryButton {
    func performAction() {
        do {
            try action()
        } catch {
            errorHandler.handle(error: error)
        }
    }
}
