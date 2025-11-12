//
//  LoginScreen.swift
//  SocialGymApp
//
//  Created by Elijah K on 11/10/25.
//

import SwiftUI
import AuthenticationServices

struct LoginScreen: View {
    @State private var email = ""
    @State private var password = ""
    // Need to create login with email
    // and password
    // or apple login
    
    // if they dont have an account, have a sign up option
    // should kickstart an onboarding process to get information
    // then they input their email and password or apple credentials
    var body: some View {
        ZStack {
            Color.primaryDark
                .ignoresSafeArea()
            
            VStack {
                Image(.spotter)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)

                Text("Login")
                    .font(Font.largeTitle.bold())
                    .foregroundStyle(.white)
                    .frame(maxWidth: 290, alignment: .leading)
                HStack {
                    Spacer()
                    Image(systemName: "at")
                        .foregroundStyle(.white)
                    VStack {
                        TextField("", text: $email, prompt: Text("Email").foregroundColor(.gray))
                        Divider()
                            .overlay(.white)
                    }
                    Spacer()
                }
                .padding(.horizontal, 50)
                .padding(.vertical, 15)
                HStack {
                    Spacer()
                    Image(systemName: "lock")
                        .foregroundStyle(.white)
                    VStack {
                        TextField("", text: $password, prompt: Text("Password").foregroundColor(.gray))
                        Divider()
                            .overlay(.white)
                    }
                    Spacer()
                }
                .padding(.horizontal, 50)
                .padding(.vertical, 15)
                VStack(alignment: .leading) {
                    Button("Forgot Password?") {
                        // Forgot password logic
                    }
                    .frame(maxWidth: 290, alignment: .trailing)
                }
                .padding(10)
                Button("Login") {
                    // login logic
                }
                .frame(width: 290, height: 50)
                .background(Color.white)
                .foregroundStyle(Color.primary)
                .cornerRadius(10)
                .padding(.top, 10)

                HStack(spacing: 12) {
                    Rectangle()
                        .fill(Color.white.opacity(0.4))
                        .frame(height: 1)
                    Text("OR")
                        .foregroundStyle(Color.gray)
                    Rectangle()
                        .fill(Color.white.opacity(0.4))
                        .frame(height: 1)
                }
                .padding(.vertical, 10)
                .frame(width: 290)
                SignInWithAppleButton(.signIn) { request in
                    // You can leave this empty while building UI
                    // request.requestedScopes = [.fullName, .email]
                } onCompletion: { result in
                    // Handle result later when wiring up auth
                }
                .signInWithAppleButtonStyle(.white)
                .opacity(0.7)
                .frame(width: 290, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.bottom, 20)
                Spacer()
                HStack {
                    Text("New to Spotter?")
                        .foregroundStyle(Color.gray)
                    Button("Sign Up") {
                        // start onboarding process
                    }
                }
            }
        }
        
    }
}

#Preview {
    LoginScreen()
}
