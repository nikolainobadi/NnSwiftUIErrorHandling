//
//  NnDisplayableError.swift
//  
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import Foundation

/// A protocol defining an error that can be displayed to the user.
/// It requires a title and a message, which can be used to build an NnErrorAlert.
/// The NnErrorAlert is required by NnSwiftUIErrorHandler to display errors.
public protocol NnDisplayableError: Error {
    /// The title of the error, used in the header of an NnErrorAlert.
    var title: String { get }
    /// The detailed error message, used in the body of an NnErrorAlert.
    var message: String { get }
}
