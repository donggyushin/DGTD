//
//  AuthView.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/11.
//

import SwiftUI

struct AuthView: View {
    
    @ObservedObject var viewModel = DI.viewModel.auth()
    
    var body: some View {
        VStack {
            AppleSignInButton(completion: viewModel.signInWithAppleButtonCompletion)
                .frame(height: 40)
        }
        .padding(.horizontal, 40)
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView().preferredColorScheme(.dark)
    }
}
