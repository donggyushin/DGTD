//
//  QuotesRepository.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/11.
//

import Combine

final class QuotesRepository {
    static let shared = QuotesRepository()
    
    private init() {}
    
    func getQuates(datasource: QuotesDataSource) -> AnyPublisher<Quotes, Error> {
        return datasource.getQuates()
    }
}
