//
//  AuthView.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/11.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        VStack {
            AppleSignInButton()
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
