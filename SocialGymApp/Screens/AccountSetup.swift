//
//  AccountSetup.swift
//  SocialGymApp
//
//  Created by Elijah K on 11/21/25.
//

import SwiftUI

struct AccountSetup: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        ZStack {
            Color.primaryDark
                .ignoresSafeArea()
            
            VStack {
                Image(.spotter)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                Text("Setup Your Account")
                    .font(Font.largeTitle.bold())
                    .foregroundStyle(.white)
                    .frame(maxWidth: 290, alignment: .leading)
                    .padding(-10)
                
                LoginInputField(systemImage: "at", placeholder: "Email", text: $email, isSecure: false)
                LoginInputField(systemImage: "lock", placeholder: "Password", text: $password, isSecure: true)
                LoginInputField(systemImage: "lock", placeholder: "Confirm Password", text: $confirmPassword, isSecure: true)
                
                Spacer()
                
               LoginOptionsView(email: $email, password: $password)
                
                Spacer()
            }
        }
    }
}

#Preview {
    AccountSetup()
}
