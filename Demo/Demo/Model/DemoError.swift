//
//  DemoError.swift
//  Demo
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import Foundation
import NnSwiftUIErrorHandling

enum DemoError: Error {
    case tryError, asyncTryError
}


// MARK: - DisplayableError
extension DemoError: NnDisplayableError {
    var title: String {
        switch self {
        case .tryError:
            return "Try Error"
        case .asyncTryError:
            return "Async Try Error"
        }
    }
    
    var message: String {
        switch self {
        case .tryError:
            return "This error came from a method that did NOT run asynchronously"
        case .asyncTryError:
            return "This is an error message for a method that had to run asynchonously"
        }
    }
}
