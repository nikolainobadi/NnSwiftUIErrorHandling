//
//  NnSwiftUIErrorHandlingViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import SwiftUI

struct NnSwiftUIErrorHandlingViewModifier: ViewModifier {
    @StateObject var errorHandling = NnSwiftUIErrorHandler()

    func body(content: Content) -> some View {
        content
            .environmentObject(errorHandling)
            .background(
                EmptyView()
                    .alert(item: $errorHandling.currentAlert) { currentAlert in
                        Alert(
                            title: Text(currentAlert.title),
                            message: Text(currentAlert.message),
                            dismissButton: .default(Text("Ok")) {
                                currentAlert.dismissAction?()
                            }
                        )
                    }
            )
    }
}

public extension View {
    func withErrorHandling() -> some View {
        modifier(NnSwiftUIErrorHandlingViewModifier())
    }
}
