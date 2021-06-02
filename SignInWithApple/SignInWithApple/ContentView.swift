//
//  ContentView.swift
//  SignInWithApple
//
//  Created by monkey on 2021/6/2.
//

import AuthenticationServices
import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("email") private var email = ""
    @AppStorage("firstName") private var firstName = ""
    @AppStorage("lastName") private var lastName = ""
    @AppStorage("userId") private var userId = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                SignInWithAppleButton(.continue) { request in
                    request.requestedScopes = [.email, .fullName]
                } onCompletion: { result in
                    switch result {
                    case .success(let auth):
//                        if let credential = auth.credential as? ASAuthorizationAppleIDCredential {
//                            // User Id
//                            userId = credential.user
//
//                            // User Info：一般而言第一次获取后需要存储到本地
//                            email = credential.email ?? ""
//                            firstName = credential.fullName?.givenName ?? ""
//                            lastName = credential.fullName?.familyName ?? ""
//                        }
                        
                        // 等价于上面的 if let
                        switch auth.credential {
                        case let credential as ASAuthorizationAppleIDCredential:
                            // User Id
                            userId = credential.user
                            
                            // User Info：一般而言第一次获取后需要存储到本地
                            email = credential.email ?? ""
                            firstName = credential.fullName?.givenName ?? ""
                            lastName = credential.fullName?.familyName ?? ""
                            
                        default:
                            break
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                .signInWithAppleButtonStyle(
                    colorScheme == .dark ? .white : .black
                )
                .frame(height: 50)
                .cornerRadius(8)
                .padding()
            }
            .navigationTitle("Sign In")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
