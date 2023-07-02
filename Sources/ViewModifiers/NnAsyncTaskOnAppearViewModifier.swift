//
//  NnAsyncTaskOnAppearViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 7/1/23.
//

import SwiftUI

struct NnAsyncTaskOnAppearViewModifier: ViewModifier {
    @EnvironmentObject var loadingHandler: NnLoadingHandler
    @EnvironmentObject var errorHandler: NnSwiftUIErrorHandler
    
    let asyncAction: () async throws -> Void
    
    func body(content: Content) -> some View {
        content
            .task {
                loadingHandler.startLoading()
                
                do {
                    try await asyncAction()
                } catch {
                    errorHandler.handle(error: error)
                }
                
                loadingHandler.stopLoading()
            }
    }
}

public extension View {
    func asyncTask(_ asyncAction: @escaping () async throws -> Void) -> some View {
        modifier(NnAsyncTaskOnAppearViewModifier(asyncAction: asyncAction))
    }
}
