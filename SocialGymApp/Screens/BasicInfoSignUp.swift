//
//  BasicInfoSignUp.swift
//  SocialGymApp
//
//  Created by Elijah K on 11/14/25.
//

import SwiftUI

struct CustomFrame: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 325, alignment: .trailing)
            .background(Color.white.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .contentShape(RoundedRectangle(cornerRadius: 10))
            .foregroundStyle(.white)
    }
}

struct CustomFrameV2: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 325, alignment: .init(horizontal: .leading, vertical: .center))
            .background(Color.white.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .contentShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct BasicInfoSignUp: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var DOB = Date.now
    @State private var selectedGender: String? = nil
    let genders = ["Male", "Female", "Other"]
    
    var body: some View {
        ZStack {
            Color.primaryDark
                .ignoresSafeArea()
            Spacer()
            ScrollView {
                VStack(spacing: 20) {
                    Spacer()
                    Spacer()
                    
                    TextField("", text: $firstName, prompt: Text("First Name").foregroundStyle(.gray))
                        .padding(20)
                        .modifier(CustomFrame())
                    TextField("", text: $lastName, prompt: Text("Last Name").foregroundStyle(.gray))
                        .padding(20)
                        .modifier(CustomFrame())
                    DatePicker("Date of Birth", selection: $DOB, displayedComponents: .date)
                        .padding()
                        .modifier(CustomFrameV2())
                        .foregroundStyle(.gray)
                        .tint(.teal)
                    
                    Section {
                        ForEach(genders, id: \.self) { gender in
                            HStack {
                                Text(gender)
                                    .foregroundStyle(.white)
                                Spacer()
                                if selectedGender == gender {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundStyle(.teal)
                                }
                            }
                            .padding(20)
                            .modifier(CustomFrame())
                            .onTapGesture {
                                selectedGender = gender
                            }
                        }
                    } header: {
                        Text("Gender")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(maxWidth: 290, alignment: .leading)
                            .padding(.top, 10)
                    }
                    Spacer()
                    Spacer()
                    
                    NavigationLink {
                        UnitsAndBodyStats()
                    } label: {
                        Text("Continue")
                            .foregroundStyle(.black)
                            .frame(width: 290, height: 50)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .contentShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .disabled(selectedGender == nil || firstName.isEmpty || lastName.isEmpty)
                }
            }
            
        }
        .navigationTitle("Tell us about you")
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color.primaryDark, for: .navigationBar)
    }
}

#Preview {
    BasicInfoSignUp()
}
