//
//  AuthViewModel.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/12.
//

import Foundation
import Combine
import AuthenticationServices

class AuthViewModel: ObservableObject {
    
    @Published var shouldPop = false
    
    private let firebaseAuth: FirebaseAuth
    
    var cancellables: Set<AnyCancellable> = []
    
    init(firebaseAuth: FirebaseAuth) {
        self.firebaseAuth = firebaseAuth
    }
    
    func AppleSignInCompletion(result: Result<ASAuthorization, Error>) {
        switch result {
        case .failure(let error):
            print("dg: error: \(error)")
        case .success(let authResults):
            if let appleIDCredential = authResults.credential as? ASAuthorizationAppleIDCredential {
                firebaseAuth.signIn(appleIDCredential: appleIDCredential)
                    .sink { completion in
                        switch completion {
                        case .failure(let error):
                            print("dg: error: \(error.localizedDescription)")
                        case .finished:
                            break
                        }
                    } receiveValue: { result in
                        self.shouldPop = true
                    }
                    .store(in: &cancellables)
            }
        }
    }
}
