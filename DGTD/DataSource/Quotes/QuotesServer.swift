//
//  QuotesServer.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/11.
//

import Combine

final class QuotesServer {
    static let shared = QuotesServer()
    
    private init() { }
    
    func getQuates() -> AnyPublisher<Quotes, Error> {
        return AC.get(url: "https://quotes.rest/qod?category=inspire", headers: [])
    }
}
