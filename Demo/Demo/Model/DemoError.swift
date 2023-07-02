//
//  DemoError.swift
//  Demo
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import Foundation
import NnSwiftUIErrorHandling

enum DemoError: Error {
    case asyncTryError
}


// MARK: - DisplayableError
extension DemoError: NnDisplayableError {
    var title: String {
        switch self {
        case .asyncTryError:
            return "Async Try Error"
        }
    }
    
    var message: String {
        switch self {
        case .asyncTryError:
            return "This is an error message for a method that had to run asynchonously"
        }
    }
}
