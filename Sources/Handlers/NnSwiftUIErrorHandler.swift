//
//  NnSwiftUIErrorHandler.swift
//  
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import Foundation

/// Class to handle errors and alert displays within SwiftUI.
public final class NnSwiftUIErrorHandler: ObservableObject {
    
    /// Published variable to hold the current alert. Views can observe this and react when it changes.
    @Published var currentAlert: NnErrorAlert?
    
    /// Function to handle errors. Converts the error to an `NnErrorAlert` and assigns it to `currentAlert`.
    public func handle(error: Error) {
        currentAlert = makeErrorAlert(from: error)
    }
}


// MARK: - Private Methods
private extension NnSwiftUIErrorHandler {
    
    /// Function to convert an `Error` to `NnErrorAlert`.
    /// If the error is `NnDisplayableError`, use its `title` and `message` for the alert.
    /// Otherwise, use the error's localized description as the alert message.
    func makeErrorAlert(from error: Error) -> NnErrorAlert {
        var errorAlert = NnErrorAlert()
        
        if let customError = error as? NnDisplayableError {
            errorAlert.title = customError.title
            errorAlert.message = customError.message
        } else {
            errorAlert.message = error.localizedDescription
        }
        
        return errorAlert
    }
}
