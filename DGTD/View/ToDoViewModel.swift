//
//  ToDoViewModel.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/05.
//

import Combine
import Foundation

class ToDoViewModel: ObservableObject {
    
    @Published private(set) var imageUrl: String?
    
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
            .map({ $0.urls.full })
            .replaceError(with: "")
            .receive(on: DispatchQueue.main)
            .sink { fullUrl in
                self.imageUrl = fullUrl
            }
            .store(in: &cancellables)
    }
    
}
