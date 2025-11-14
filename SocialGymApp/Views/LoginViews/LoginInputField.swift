//
//  LoginInputField.swift
//  SocialGymApp
//
//  Created by Elijah K on 11/12/25.
//

import SwiftUI

struct LoginInputField: View {
    let systemImage: String
    let placeholder: String
    @Binding var text: String
    let isSecure: Bool 
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: systemImage)
                .foregroundStyle(.white)
            VStack {
                if isSecure {
                    SecureField("", text: $text, prompt: Text(placeholder).foregroundColor(.gray))
                        .foregroundStyle(.white)
                } else {
                    TextField("", text: $text, prompt: Text(placeholder).foregroundColor(.gray))
                        .foregroundStyle(.white)
                }
                Divider().overlay(.white)
            }
            Spacer()
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 15)
    }
}
