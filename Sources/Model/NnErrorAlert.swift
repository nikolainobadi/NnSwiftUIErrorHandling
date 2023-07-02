//
//  NnErrorAlert.swift
//  
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import Foundation

struct NnErrorAlert: Identifiable {
    var id = UUID()
    var title: String = "Error"
    var message: String = ""
    var dismissAction: (() -> Void)?
}
