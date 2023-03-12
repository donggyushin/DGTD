//
//  AppleSignInButton.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/11.
//

import SwiftUI
import Combine
import AuthenticationServices

struct AppleSignInButton: View {
    
    @Binding var shouldPop: Bool
    
    let firebaseAuth: FirebaseAuth
    
    var body: some View {
        
        var cancellables: Set<AnyCancellable> = []
        
        SignInWithAppleButton { request in
            request.nonce = firebaseAuth.sha256(firebaseAuth.getCurrentNonce())
        } onCompletion: { result in
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
}

struct AppleSignInButton_Previews: PreviewProvider {
    
    static func completion(result: Result<ASAuthorization, Error>) {
        print(result)
    }
    
    static var previews: some View {
        AppleSignInButton(shouldPop: .constant(false), firebaseAuth: FirebaseAuth.shared).preferredColorScheme(.dark)
    }
}
