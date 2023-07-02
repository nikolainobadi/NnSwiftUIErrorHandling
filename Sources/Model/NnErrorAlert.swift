//
//  NnErrorAlert.swift
//  
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import Foundation

/// A struct defining an alert that displays an error.
/// It uses the properties defined in the NnDisplayableError protocol
/// to present an error in an alert controlled by the NnSwiftUIErrorHandler.
struct NnErrorAlert: Identifiable {
    /// Unique ID for the alert.
    var id = UUID()
    
    /// The title of the alert, defaulted to "Error". This is typically populated from NnDisplayableError.title.
    var title: String = "Error"
    
    /// The detailed message to be displayed in the body of the alert. This is typically populated from NnDisplayableError.message.
    var message: String = ""
    
    /// An optional closure that will be executed when the alert is dismissed.
    var dismissAction: (() -> Void)?
}
