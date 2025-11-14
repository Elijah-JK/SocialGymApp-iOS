//
//  LoginOptionsView.swift
//  SocialGymApp
//
//  Created by Elijah K on 11/12/25.
//

import AuthenticationServices
import SwiftUI

struct LoginOptionsView: View {
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        VStack(spacing: 15) {
            Button {
                // action
                print("Finally!")
            } label: {
                Text("Login")
                    .foregroundStyle(.black)
                    .frame(width: 290, height: 50)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .contentShape(RoundedRectangle(cornerRadius: 10))
            }
            .disabled(email.isEmpty || password.isEmpty)

            HStack(spacing: 12) {
                Rectangle().fill(Color.white.opacity(0.4)).frame(height: 1)
                Text("OR").foregroundStyle(Color.gray)
                Rectangle().fill(Color.white.opacity(0.4)).frame(height: 1)
            }
            .frame(width: 290)

            SignInWithAppleButton(.signIn) { request in }
            onCompletion: { _ in }
            .signInWithAppleButtonStyle(.white)
            .opacity(0.7)
            .frame(width: 290, height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    LoginOptionsView(email: .constant(""), password: .constant(""))
}
