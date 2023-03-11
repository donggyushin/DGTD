//
//  Store.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/11.
//

let store = Store.shared

final class Store {
    static let shared = Store()
    
    let user = UserStore.shared
    
    private init() {}
}
