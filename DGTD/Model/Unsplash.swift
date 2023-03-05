//
//  Unsplash.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/05.
//

import Foundation

struct Unsplash: Decodable {
    let id: String
    let urls: Urls
    let user: User
}

extension Unsplash {
    struct Urls: Decodable {
        let raw: String
        let full: String
        let regular: String
        let small: String
        let thumb: String
        let small_s3: String
    }
    
    struct User: Decodable {
        let name: String?
        let instagram_username: String?
    }
}
