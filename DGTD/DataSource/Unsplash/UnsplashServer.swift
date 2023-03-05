//
//  UnsplashServer.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/05.
//

import Combine

final class UnsplashServer {
    
    static let shared = UnsplashServer()
    
    private init() {}
    
    func getPhotos() -> AnyPublisher<[Unsplash], Error> {
        return AC.get(url: "https://api.unsplash.com/photos", headers: [.unsplash])
    }
    
    func getPhoto() -> AnyPublisher<Unsplash, Error> {
        return AC.get(url: "https://api.unsplash.com/photos/random", headers: [.unsplash])
    }
    
}
