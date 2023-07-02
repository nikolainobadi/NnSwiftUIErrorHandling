//
//  NnSwiftUIErrorHandlingViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import SwiftUI

/// A ViewModifier that handles and presents errors in SwiftUI Views.
struct NnSwiftUIErrorHandlingViewModifier: ViewModifier {
    
    /// Instance of NnSwiftUIErrorHandler that handles incoming errors
    @StateObject var errorHandling = NnSwiftUIErrorHandler()

    /// The body of the view modifier.
    /// It modifies the content by injecting the error handler as an environment object,
    /// and adding a background alert that is triggered when there is an error to display.
    func body(content: Content) -> some View {
        content
            .environmentObject(errorHandling)  // Injects the error handler into the view hierarchy
            .background(
                EmptyView()
                    .alert(item: $errorHandling.currentAlert) { currentAlert in  // Alert is triggered when there's an error
                        Alert(
                            title: Text(currentAlert.title),  // The title of the error message
                            message: Text(currentAlert.message),  // The error message
                            dismissButton: .default(Text("Ok")) {  // A button to dismiss the error message
                                currentAlert.dismissAction?()  // Optional action to perform on dismissal
                            }
                        )
                    }
            )
    }
}

public extension View {
    /// A function to use NnSwiftUIErrorHandlingViewModifier on any View
    func withErrorHandling() -> some View {
        modifier(NnSwiftUIErrorHandlingViewModifier())
    }
}
