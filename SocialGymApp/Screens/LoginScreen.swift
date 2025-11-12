//
//  LoginScreen.swift
//  SocialGymApp
//
//  Created by Elijah K on 11/10/25.
//

import SwiftUI

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
                LoginInputField(systemImage: "at", placeholder: "Email", text: $email, isSecure: false)
                LoginInputField(systemImage: "lock", placeholder: "Password", text: $password, isSecure: true)

                VStack(alignment: .leading) {
                    Button("Forgot Password?") {
                        // Forgot password logic
                    }
                    .frame(maxWidth: 290, alignment: .trailing)
                }
                .padding(10)
                LoginOptionsView()
                    .padding(.top, 10)
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
