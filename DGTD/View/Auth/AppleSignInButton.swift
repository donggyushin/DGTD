//
//  AppleSignInButton.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/11.
//

import SwiftUI
import AuthenticationServices

struct AppleSignInButton: View {
    
    let completion: (Result<ASAuthorization, Error>) -> Void
    let firebaseAuth: FirebaseAuth
    
    var body: some View {
        
        SignInWithAppleButton(onRequest: { request in
            request.nonce = firebaseAuth.sha256(firebaseAuth.getCurrentNonce())
        }, onCompletion: completion)
    }
}

struct AppleSignInButton_Previews: PreviewProvider {
    
    static func completion(result: Result<ASAuthorization, Error>) {
        print(result)
    }
    
    static var previews: some View {
        AppleSignInButton(completion: completion, firebaseAuth: FirebaseAuth.shared).preferredColorScheme(.dark)
    }
}
