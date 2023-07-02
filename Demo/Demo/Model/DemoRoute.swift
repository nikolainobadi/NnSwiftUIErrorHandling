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
            TryButtonDemoView(details: details)
        case .asyncTryButton:
            AsyncTryButtonDemoView(details: details)
        case .asyncTask:
            AsyncTaskDemoView(details: details, withError: false)
        case .asyncTaskError:
            AsyncTaskDemoView(details: details, withError: true)
        }
    }
}


// MARK: - Details
extension DemoRoute {
    var details: String {
        switch self {
        case .tryButton:
            return "NnTryButton handles methods that throw errors without needing async. Errors thrown are shown in an alert"
        case .asyncTryButton:
            return "NnAsyncTryButton will show a loading view only while the method is running. If an error is thrown, it will be displayed in an alert."
        case .asyncTask:
            return "Using the .asyncTask view modifier will dislay a loading view until the task finishes."
        case .asyncTaskError:
            return "Any error thrown when using the .asyncTask view modifier will be displayed."
        }
    }
}
