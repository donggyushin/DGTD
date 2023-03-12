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
    
    var body: some View {
        
        SignInWithAppleButton(onRequest: { request in
            print("dg: request: \(request)")
        }, onCompletion: completion)
    }
}

struct AppleSignInButton_Previews: PreviewProvider {
    
    static func completion(result: Result<ASAuthorization, Error>) {
        print(result)
    }
    
    static var previews: some View {
        AppleSignInButton(completion: completion).preferredColorScheme(.dark)
    }
}
