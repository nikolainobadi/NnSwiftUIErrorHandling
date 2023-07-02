//
//  NnLoadingHandler.swift
//  
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import Foundation

final class NnLoadingHandler: ObservableObject {
   @Published var isLoading: Bool = false

   func startLoading() {
       isLoading = true
   }

   func stopLoading() {
       isLoading = false
   }
}
