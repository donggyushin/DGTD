//
//  FirebaseAuth.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/12.
//

import Combine
import FirebaseAuth

final class FirebaseAuth {
    static let shared = FirebaseAuth()
    
    private init() { }
    
    func addStateDidChangeListener(listener: @escaping (Auth, User?) -> Void) {
        Auth.auth().addStateDidChangeListener(listener)
    }
    
    func createUser(userIdentifier: String) -> AnyPublisher<AuthDataResult, Error> {
        return Future<AuthDataResult, Error> { promise in
            Auth.auth().createUser(withEmail: userIdentifier, password: userIdentifier) { result, error in
                if let error = error {
                    promise(.failure(error))
                } else if let result = result {
                    promise(.success(result))
                } else {
                    promise(.failure(CustomError.unknown))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func signIn(userIdentifier: String) {
        
    }
}
