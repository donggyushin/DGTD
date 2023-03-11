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
            print("dg: result: \(result)")
        }
    }
}

struct AppleSignInButton_Previews: PreviewProvider {
    static var previews: some View {
        AppleSignInButton().preferredColorScheme(.dark)
    }
}
