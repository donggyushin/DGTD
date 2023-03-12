//
//  AuthView.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/11.
//

import SwiftUI

struct AuthView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var shouldPop = false
    
    var body: some View {
        VStack {
            AppleSignInButton(shouldPop: $shouldPop, firebaseAuth: FirebaseAuth.shared)
                .frame(height: 40)
        }
        .padding(.horizontal, 40)
        .onChange(of: shouldPop) { newValue in
            if newValue {
                dismiss()
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView().preferredColorScheme(.dark)
    }
}
