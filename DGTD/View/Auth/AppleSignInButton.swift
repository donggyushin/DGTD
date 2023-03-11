//
//  AppleSignInButton.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/11.
//

import SwiftUI
import AuthenticationServices

struct AppleSignInButton: View {
    var body: some View {
        SignInWithAppleButton { request in
            print("dg: request: \(request)")
        } onCompletion: { result in
            switch result {
            case .failure(let error):
                print("dg: error: \(error.localizedDescription)")
            case .success(let authResults):
                
                if let appleIDCredential = authResults.credential as? ASAuthorizationAppleIDCredential {
                    // 계정 정보 가져오기
                    let UserIdentifier = appleIDCredential.user
                    let fullName = appleIDCredential.fullName
                    let name =  (fullName?.familyName ?? "") + (fullName?.givenName ?? "")
                    let email = appleIDCredential.email
                    let IdentityToken = String(data: appleIDCredential.identityToken!, encoding: .utf8)
                    let AuthorizationCode = String(data: appleIDCredential.authorizationCode!, encoding: .utf8)
                    
                    print("dg: UserIdentifier: \(UserIdentifier)")
                    print("dg: fullName: \(fullName)")
                    print("dg: name: \(name)")
                    print("dg: email: \(email)")
                    print("dg: IdentityToken: \(IdentityToken)")
                    print("dg: AuthorizationCode: \(AuthorizationCode)")
                    
                }
                    
            }
        }
    }
}

struct AppleSignInButton_Previews: PreviewProvider {
    static var previews: some View {
        AppleSignInButton().preferredColorScheme(.dark)
    }
}
