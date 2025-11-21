//
//  ProfilePreferences.swift
//  SocialGymApp
//
//  Created by Elijah K on 11/20/25.
//

import SwiftUI

struct ProfilePreferences: View {
    @State private var bio: String = ""
    @State private var isPublic: Bool = true
    
    var body: some View {
        ZStack {
            Color.primaryDark
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // will have an upload picture soon
                
                Section {
                    TextEditor(text: $bio)
                        .padding()
                        .frame(width: 325, height: 125, alignment: .topLeading)
                        .scrollContentBackground(.hidden)
                        .background(.white.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.leading)
                        .textInputAutocapitalization(.sentences)
                        .overlay(alignment: .topLeading) {
                            if bio.isEmpty {
                                Text("Bio... (optional)")
                                    .foregroundStyle(.gray)
                                    .padding()
                                    .padding(.top, 8)
                                    .padding(.horizontal, 3)
                                    .allowsHitTesting(false)
                            }
                        
                        }
                } header: {
                    Text("Bio")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: 290, alignment: .leading)
                        .padding(.top, 20)
                }
                
                Section {
                    Toggle("Public", isOn: $isPublic)
                        .padding()
                        .frame(width: 325, alignment: .topLeading)
                        .background(.white.opacity(0.1))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                } header: {
                    Text("Privacy Type")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: 290, alignment: .leading)
                        .padding(.top, 20)
                }
                
                Spacer()
                
                NavigationLink {
                    FitnessGoals()
                } label: {
                    Text("Continue")
                        .foregroundStyle(.black)
                        .frame(width: 290, height: 50)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .contentShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.bottom, 20)
            }
        }
        .navigationTitle("Profile Preferences")
    }
}

#Preview {
    ProfilePreferences()
}
