//
//  ActivityInfo.swift
//  SocialGymApp
//
//  Created by Elijah K on 11/17/25.
//

import SwiftUI

struct ActivityInfo: View {
    @State private var selectedActivityLevel: String = ""
    @State private var selectedExperienceLevel: String = ""
    
    let activityLevels = ["Sedentary", "Lightly Active", "Mod. Active", "Very Active", "Super Active"]
    let experienceLevels = ["Beginner", "Intermediate", "Advanced"]
    
    private let columns = [GridItem(.fixed(162.5)), GridItem(.fixed(162.5))]
    
    var body: some View {
        ZStack {
            Color.primaryDark
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Section {
                    LazyVGrid(columns: columns) {
                        ForEach(activityLevels, id: \.self) { level in
                            Button {
                                selectedActivityLevel = level
                            } label: {
                                HStack {
                                    Text(level)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.8)
                                    Spacer()
                                    if level == selectedActivityLevel {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundStyle(.teal)
                                    }
                                }
                                .padding()
                                .frame(width: 162.5, alignment: .center)
                                .background(Color.white.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .contentShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundStyle(.white)
                            }
                            
                        }
                    }
                } header : {
                    Text("Activity Level")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: 290, alignment: .leading)
                        .padding(.top, 20)
                }
                
                Text("Experience Level")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: 290, alignment: .leading)
                    .padding()
                
                ForEach(experienceLevels, id: \.self) { level in
                    Button {
                        selectedExperienceLevel = level
                    } label: {
                        HStack {
                            Text(level)
                            Spacer()
                            if level == selectedExperienceLevel {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundStyle(.teal)
                            }
                        }
                        .padding(20)
                        .modifier(CustomFrame())
                    }
                }
                
                Spacer()
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
                .disabled(selectedActivityLevel.isEmpty || selectedExperienceLevel.isEmpty)
                .padding(.bottom, 20)
                
            }
        }
        .navigationTitle("Activity Info")
    }
}

#Preview {
    ActivityInfo()
}
