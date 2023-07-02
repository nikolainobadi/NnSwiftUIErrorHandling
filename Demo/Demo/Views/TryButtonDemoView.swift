//
//  TryButtonDemoView.swift
//  Demo
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import SwiftUI
import NnSwiftUIErrorHandling

struct TryButtonDemoView: View {
    @State private var shouldShowSuccess = false
    
    let details: String
    
    private func action(withError: Bool = false) throws {
        if withError { throw DemoError.tryError }
        
        shouldShowSuccess = true
    }
    
    var body: some View {
        VStack {
            DemoButton(text: "Success", color: .green, action: {
                try action()
            })
            
            DemoButton(text: "Error", color: .red, action: {
                try action(withError: true)
            })
        }
        .withDemoInfo(title: "Try Button", details: details, shouldShowSuccess: $shouldShowSuccess)
    }
}


// MARK: - Button
fileprivate struct DemoButton: View {
    let text: String
    let color: Color
    let action: () throws -> Void
    
    var body: some View {
        NnTryButton(action: action) {
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
struct TryButtonDemoView_Previews: PreviewProvider {
    static var previews: some View {
        TryButtonDemoView(details: DemoRoute.tryButton.details)
            .withLoadingView()
            .withErrorHandling()
    }
}

