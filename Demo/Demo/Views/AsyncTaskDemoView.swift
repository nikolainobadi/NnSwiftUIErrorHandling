//
//  AsyncTaskDemoView.swift
//  Demo
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import SwiftUI
import NnSwiftUIErrorHandling

struct AsyncTaskDemoView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var shouldShowSuccess = false
    
    let details: String
    let withError: Bool
    
    private var title: String {
        return "Async Task \(withError ? "with Error" : "")"
    }
    
    var body: some View {
        VStack {
            
        }
        .withDemoInfo(title: title, details: details, shouldShowSuccess: $shouldShowSuccess)
        .asyncTask {
            try await Task.sleep(nanoseconds: 1_500_000_000)
            
            if withError {
                throw DemoError.asyncTryError
            }
            
            shouldShowSuccess = true
        }
        .onChange(of: shouldShowSuccess) { newValue in
            if newValue == false {
                print("Reset button was pressed, dismissing view")
                dismiss()
            }
        }
    }
}


// MARK: - Preview
struct AsyncTaskDemoView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncTaskDemoView(details: DemoRoute.asyncTask.details, withError: false)
            .withLoadingView()
            .withErrorHandling()
    }
}
