//
//  BasicInfoSignUp.swift
//  SocialGymApp
//
//  Created by Elijah K on 11/14/25.
//

import SwiftUI

struct BasicInfoSignUp: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var DOB = Date.now
    @State private var gender: Gender?
    
    var body: some View {
        ZStack {
            Color.primaryDark
                .ignoresSafeArea()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                
        }
        .navigationTitle("Tell us about you")
    }
}

#Preview {
    BasicInfoSignUp()
}
