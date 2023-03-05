//
//  APIClient.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/05.
//

import Combine
import Foundation

let AC = APIClient()

final class APIClient {
    fileprivate init() { }
    
    func get<T: Decodable>(url: String, headers: [Header]) -> AnyPublisher<T, Error> {
        guard let url = URL(string: url) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        
        headers.forEach({
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        })
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

extension APIClient {
    struct Header {
        
        static let unsplash = Header(value: "Client-ID \(Secret.unsplash.accessKey)", key: "Authorization")
        
        let value: String
        let key: String
    }
}
