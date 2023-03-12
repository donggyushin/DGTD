//
//  AuthView.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/11.
//

import SwiftUI
import Combine

struct AuthView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AppleSignInButton(firebaseAuth: FirebaseAuth.shared, completion: viewModel.AppleSignInCompletion)
                .frame(height: 40)
        }
        .padding(.horizontal, 40)
        .onChange(of: viewModel.shouldPop) { newValue in
            if newValue {
                dismiss()
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(viewModel: DI.viewModel.auth()).preferredColorScheme(.dark)
    }
}
