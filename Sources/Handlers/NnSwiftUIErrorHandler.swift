//
//  NnSwiftUIErrorHandler.swift
//  
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import Foundation

final class NnSwiftUIErrorHandler: ObservableObject {
    @Published var currentAlert: NnErrorAlert?
    
    func handle(error: Error) {
        currentAlert = makeErrorAlert(from: error)
    }
}


// MARK: - Private Methods
private extension NnSwiftUIErrorHandler {
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
