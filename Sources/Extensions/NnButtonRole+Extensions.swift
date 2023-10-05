//
//  NnButtonRole+Extensions.swift
//  
//
//  Created by Nikolai Nobadi on 10/5/23.
//

import SwiftUI

@available(iOS 15.0, *)
internal extension NnButtonRole {
    var buttonRole: ButtonRole? {
        switch self {
        case .cancel:
            return .cancel
        case .destructive:
            return .destructive
        }
    }
}
