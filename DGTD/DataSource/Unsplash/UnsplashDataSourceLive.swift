//
//  UnsplashDataSource.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/05.
//

import Combine
import Foundation

final class UnsplashDataSourceLive {
    
    static let shared = UnsplashDataSourceLive()
    
    private init() {}
    
    func getPhotos() -> AnyPublisher<Unsplash, Error> {
        guard let url = URL(string: "https://api.unsplash.com/photos") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.addValue("Client-ID \(Secret.unsplash.accessKey)", forHTTPHeaderField: "Authorization")
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: Unsplash.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
