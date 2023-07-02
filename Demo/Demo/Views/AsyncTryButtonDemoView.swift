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
    
    private func action(withError: Bool = false) async throws {
        if withError { throw DemoError.asyncTryError }
        
        shouldShowSuccess = true
    }
    
    var body: some View {
        VStack {
            Text("Async Try Button")
                .underline()
                .font(.largeTitle)
            
            
            Text("NnAsyncTryButton will show a loading view only while the method is running. If an error is thrown, it will be displayed in an alert.")
                .padding()
                .multilineTextAlignment(.center)
            
            if shouldShowSuccess {
                VStack {
                    Text("Yay, the action succeeded!")
                        .bold()
                        .foregroundColor(.green)
                    
                    Button("Reset", action: { shouldShowSuccess = false })
                }
            }
            
            Spacer()
            VStack {
                DemoButton(text: "Success", color: .green, action: {
                    try await action()
                })
                
                DemoButton(text: "Error", color: .red, action: {
                    try await action(withError: true)
                })
            }
            Spacer()
        }
    }
}


// MARK: - Button
fileprivate struct DemoButton: View {
    let text: String
    let color: Color
    let action: () async throws -> Void
    
    var body: some View {
        NnAsyncTryButton {
            try await Task.sleep(nanoseconds: 2_000_000_000)
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
        AsyncTryButtonDemoView()
            .withLoadingView()
            .withErrorHandling()
    }
}
