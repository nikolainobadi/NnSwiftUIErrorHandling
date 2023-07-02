//
//  AsyncTryButtonDemoView.swift
//  Demo
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import SwiftUI
import NnSwiftUIErrorHandling

struct AsyncTryButtonDemoView: View {
    @State private var shouldShowSuccess = false
    
    let details: String
    
    var body: some View {
        VStack {
            DemoButton(text: "Success", color: .green, action: {
                shouldShowSuccess = true
            })
            
            DemoButton(text: "Error", color: .red, action: {
                throw DemoError.asyncTryError
            })
        }
        .withDemoInfo(title: "Async Try Button", details: details, shouldShowSuccess: $shouldShowSuccess)
    }
}


// MARK: - Button
fileprivate struct DemoButton: View {
    let text: String
    let color: Color
    let action: () async throws -> Void
    
    var body: some View {
        NnAsyncTryButton {
            try await Task.sleep(nanoseconds: 1_500_000_000)
            try await action()
        } label: {
            Text(text)
                .bold()
                .font(.title3)
                .frame(width: 200)
        }
        .tint(color)
        .buttonStyle(.borderedProminent)
        .padding()
    }
}


// MARK: - Previews
struct AsyncTryButtonDemoView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncTryButtonDemoView(details: DemoRoute.asyncTryButton.details)
            .withNnLoadingView()
            .withNnErrorHandling()
    }
}
