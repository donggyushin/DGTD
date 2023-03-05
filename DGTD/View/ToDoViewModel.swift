//
//  ToDoViewModel.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/05.
//

import Combine

class ToDoViewModel: ObservableObject {
    
    private let unsplashRepository: UnsplashRepository
    private let unsplashServer: UnsplashServer
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(unsplashRepository: UnsplashRepository,
         unsplashServer: UnsplashServer) {
        self.unsplashRepository = unsplashRepository
        self.unsplashServer = unsplashServer
        
        fetchPhoto()
    }
    
    private func fetchPhoto() {
        unsplashRepository.getPhoto(datasource: unsplashServer)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("dg: error: \(error.localizedDescription)")
                case .finished:
                    print("dg: finish")
                }
            } receiveValue: { unsplash in
                print("dg: unsplash: \(unsplash)")
            }
            .store(in: &cancellables)

    }
    
}
