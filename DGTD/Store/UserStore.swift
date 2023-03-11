//
//  UserStore.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/11.
//

import Combine

final class UserStore {
    
    static let shared = UserStore()
    
    @Published private(set) var isLogin = false
    
    private init() { }
}
