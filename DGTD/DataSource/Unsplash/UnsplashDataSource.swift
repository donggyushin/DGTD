//
//  UnsplashDataSource.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/11.
//

import Combine

protocol UnsplashDataSource {
    func getPhotos() -> AnyPublisher<[Unsplash], Error>
    func getPhoto() -> AnyPublisher<Unsplash, Error>
}
