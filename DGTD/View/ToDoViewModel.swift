//
//  ToDoViewModel.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/05.
//

import Combine

class ToDoViewModel: ObservableObject {
    
    private let unsplashRepository: UnsplashRepository
    private let unsplashDatasource: UnsplashDataSource
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(unsplashRepository: UnsplashRepository,
         unsplashDatasource: UnsplashDataSource) {
        self.unsplashRepository = unsplashRepository
        self.unsplashDatasource = unsplashDatasource
        
        fetchPhoto()
    }
    
    private func fetchPhoto() {
        unsplashRepository.getPhotos(datasource: unsplashDatasource)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("dg: error: \(error.localizedDescription)")
                case .finished:
                    print("dg: finish")
                }
            } receiveValue: { unsplashs in
                print("dg: unsplash: \(unsplashs)")
            }
            .store(in: &cancellables)

    }
    
}
