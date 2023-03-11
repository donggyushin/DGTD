//
//  ToDoViewModel.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/05.
//

import Combine
import Foundation

class ToDoViewModel: ObservableObject {
    
    private let defaultImageUrl = "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg"
    
    @Published private(set) var imageUrl: String?
    @Published var todoText: String = ""
    
    private let unsplashRepository: UnsplashRepository
    private let unsplashServer: UnsplashServer
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(unsplashRepository: UnsplashRepository,
         unsplashServer: UnsplashServer) {
        self.unsplashRepository = unsplashRepository
        self.unsplashServer = unsplashServer
        
        fetchPhoto()
    }
    
    func onSubmit() {
        saveTodo()
    }
    
    private func saveTodo() {
        self.todoText = ""
    }
    
    private func fetchPhoto() {
        unsplashRepository.getPhoto(datasource: unsplashServer)
            .map({ $0.urls.full })
            .replaceError(with: defaultImageUrl)
            .receive(on: DispatchQueue.main)
            .sink { fullUrl in
                self.imageUrl = fullUrl
            }
            .store(in: &cancellables)
    }
}
