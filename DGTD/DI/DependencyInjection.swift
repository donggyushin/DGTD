//
//  DependencyInjection.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/11.
//

import Foundation

let DI = DependencyInjection.shared

final class DependencyInjection {
    static let shared = DependencyInjection()
    
    let viewModel = ViewModel()
    
    private init() {}
}

extension DependencyInjection {
    class ViewModel {
        
        fileprivate init() { }
        
        func toDo() -> ToDoViewModel {
            ToDoViewModel(unsplashRepository: UnsplashRepository.shared, unsplashServer: UnsplashServer.shared, quotesRepository: QuotesRepository.shared, quotesServer: QuotesServer.shared)
        }
        
        func auth() -> AuthViewModel {
            AuthViewModel()
        }
    }
}
