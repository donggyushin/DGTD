//
//  Quote.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/11.
//

import Foundation

struct Quotes: Decodable {
    
    struct Contents: Decodable {
        let quotes: [Quote]
    }

    struct Quote: Decodable {
        let quote: String
        let author: String
        let date: String
    }

    struct Copyright: Decodable {
        let year: Int
        let url: String
    }
    
    let contents: Contents
    let copyright: Copyright
}
