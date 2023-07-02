//
//  NnDisplayableError.swift
//  
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import Foundation

public protocol NnDisplayableError: Error {
    /// The title of the error. This is typically a short string that summarizes the error.
    var title: String { get }
    
    /// The message of the error. This is typically a longer string that describes the error in more detail.
    var message: String { get }
}
