//
//  UnsplashDataSource.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/05.
//

import Combine
import Foundation

final class UnsplashDataSourceLive: UnsplashDataSource {
    
    static let shared = UnsplashDataSourceLive()
    
    private init() {}
    
    func getPhotos() -> AnyPublisher<[Unsplash], Error> {
        return AC.requestGet(url: "https://api.unsplash.com/photos", headers: [.unsplash])
    }
    
    func getPhoto() -> AnyPublisher<Unsplash, Error> {
        return AC.requestGet(url: "https://api.unsplash.com/photos/random", headers: [.unsplash])
    }
    
}
