//
//  DemoViewModifier.swift
//  Demo
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import SwiftUI

struct DemoViewModifier: ViewModifier {
    @Binding var shouldShowSuccess: Bool
    
    let title: String
    let details: String
    
    func body(content: Content) -> some View {
        VStack {
            Text(title)
                .underline()
                .font(.largeTitle)
            
            Text(details)
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
            content
            Spacer()
        }
    }
}

extension View {
    func withDemoInfo(title: String, details: String, shouldShowSuccess: Binding<Bool>) -> some View {
        modifier(DemoViewModifier(shouldShowSuccess: shouldShowSuccess, title: title, details: details))
    }
}
