//
//  UnsplashRepository.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/05.
//

import Combine

final class UnsplashRepository {
    static let shared = UnsplashRepository()
    
    private init() {}
    
    func getPhotos(datasource: UnsplashServer) -> AnyPublisher<[Unsplash], Error> {
        return datasource.getPhotos()
    }
    
    func getPhoto(datasource: UnsplashServer) -> AnyPublisher<Unsplash, Error> {
        return datasource.getPhoto()
    }
}
