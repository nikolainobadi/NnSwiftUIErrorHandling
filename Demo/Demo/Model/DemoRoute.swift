//
//  DemoRoute.swift
//  Demo
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import SwiftUI

enum DemoRoute: String, CaseIterable {
    case tryButton = "Try Button"
    case asyncTryButton = "Async Try Button"
    case asyncTask = "Async Task Success"
    case asyncTaskError = "Async Task Error"
}


// MARK: - Identifiable
extension DemoRoute: Identifiable {
    var id: String {
        return rawValue
    }
}


// MARK: - View
extension DemoRoute: View {
    var body: some View {
        switch self {
        case .tryButton:
            EmptyView()
        case .asyncTryButton:
            EmptyView()
        case .asyncTask:
            EmptyView()
        case .asyncTaskError:
            EmptyView()
        }
    }
}
