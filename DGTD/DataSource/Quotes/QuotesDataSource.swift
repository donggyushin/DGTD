//
//  QuotesDataSource.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/11.
//

import Combine

protocol QuotesDataSource {
    func getQuates() -> AnyPublisher<Quotes, Error>
}
