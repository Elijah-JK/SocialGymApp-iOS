//
//  FitnessGoals.swift
//  SocialGymApp
//
//  Created by Elijah K on 11/19/25.
//

import SwiftUI

struct FitnessGoals: View {
    @State private var fitnessGoals: [String: Bool] = ["Strength": false, "Hypertrophy": false, "Endurance": false, "Flexibility": false, "Mobility": false, "Weight Loss": false, "Active": false, "General Health": false]
    private let columns = [GridItem(.fixed(162.5)), GridItem(.fixed(162.5))]
    
    var body: some View {
        ZStack {
            Color.primaryDark
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Section {
                    LazyVGrid(columns: columns) {
                        ForEach(Array(fitnessGoals.keys), id: \.self) { goal in
                            Button {
                                fitnessGoals[goal]?.toggle()
                            } label: {
                                HStack {
                                    Text(goal)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.8)
                                    Spacer()
                                    if fitnessGoals[goal] == true {
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
                    Text("Choose a minimum of 3 Fitness Goals")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: 290, alignment: .leading)
                        .padding(.top, 20)
                }
                
                Spacer()
                
                NavigationLink {
                    ProfilePreferences()
                } label: {
                    Text("Continue")
                        .foregroundStyle(.black)
                        .frame(width: 290, height: 50)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .contentShape(RoundedRectangle(cornerRadius: 10))
                }
                .disabled(fitnessGoals.values.filter { $0 == true }.count < 3)
                .padding(.bottom, 20)
                
            }
        }
        .navigationTitle("Fitness Goals")
    }
}

#Preview {
    FitnessGoals()
}
