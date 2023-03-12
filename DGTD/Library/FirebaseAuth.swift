//
//  FirebaseAuth.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/12.
//

import Combine
import FirebaseAuth
import CryptoKit
import AuthenticationServices

final class FirebaseAuth {
    static let shared = FirebaseAuth()
    
    private var currentNonce: String?
    
    private init() { }
    
    func getCurrentNonce() -> String {
        guard let currentNonce = currentNonce else {
            let nonce = randomNonceString()
            self.currentNonce = nonce
            return nonce
        }
        return currentNonce
    }
    
    func addStateDidChangeListener(listener: @escaping (Auth, User?) -> Void) {
        Auth.auth().addStateDidChangeListener(listener)
    }
    
    func signIn(appleIDCredential: ASAuthorizationAppleIDCredential) -> AnyPublisher<AuthDataResult, Error> {
        UserDefaults.standard.set(appleIDCredential.user, forKey: "appleAuthorizedUserIdKey")
        
        // Retrieve the secure nonce generated during Apple sign in
        guard let nonce = currentNonce else {
            return Fail(error: CustomError.unknown).eraseToAnyPublisher()
        }

        // Retrieve Apple identity token
        guard let appleIDToken = appleIDCredential.identityToken else {
            return Fail(error: CustomError.unknown).eraseToAnyPublisher()
        }

        // Convert Apple identity token to string
        guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
            return Fail(error: CustomError.unknown).eraseToAnyPublisher()
        }

        // Initialize a Firebase credential using secure nonce and Apple identity token
        let firebaseCredential = OAuthProvider.credential(withProviderID: "apple.com",
                                                          idToken: idTokenString,
                                                          rawNonce: nonce)
        
        return Future<AuthDataResult, Error> { promise in
            Auth.auth().signIn(with: firebaseCredential) { result, error in
                if let error = error {
                    promise(.failure(error))
                } else if let result = result {
                    promise(.success(result))
                } else {
                    promise(.failure(CustomError.unknown))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: Array<Character> =
            Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
}
