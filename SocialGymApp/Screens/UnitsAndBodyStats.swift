//
//  UnitsAndBodyStats.swift
//  SocialGymApp
//
//  Created by Elijah K on 11/14/25.
//

import SwiftUI

// might separate views, not important rn
struct UnitsAndBodyStats: View {
    @State private var selectedUnit: String = "Imperial"
    @State private var heightCm: Int = 0
    @State private var weightKg: Int = 0
    
    @State private var heightFeet: Int = 0
    @State private var heightInches: Int = 0
    @State private var weightPounds: Int = 0
    
    @State private var heightValue: Int = 0
    @State private var weightValue: Int = 0
    
    let units = ["Imperial", "Metric"]
    
    var body: some View {
        ZStack {
            Color.primaryDark
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Choose your preferred units below")
                    .font(.headline)
                    .frame(maxWidth: 290, alignment: .leading)
                    .foregroundStyle(.white)
                    .padding(.top, 50)
                Picker("", selection: $selectedUnit) {
                    ForEach(units, id: \.self) { unit in
                        Text(unit)
                    }
                }
                .onChange(of: selectedUnit) { _, _ in
                    heightValue = 0
                    weightValue = 0
                    heightFeet = 0
                    heightInches = 0
                    weightPounds = 0
                }
                .padding(15)
                .modifier(CustomFrame())
                .tint(.teal)
                
                Text("Enter in your height")
                    .font(.headline)
                    .frame(maxWidth: 290, alignment: .leading)
                    .foregroundStyle(.white)
                    .padding(.top, 10)
                
                if selectedUnit == "Imperial" {
                    HStack {
                        TextField("", value: $heightFeet, format: .number)
                            .keyboardType(.numberPad)
                        Spacer()
                        Text("ft")
                        
                        Rectangle()
                            .fill(Color.gray.opacity(0.4))
                            .frame(width: 1, height: 24)
                            .padding(.horizontal, 8)
                        
                        TextField("", value: $heightInches, format: .number)
                            .keyboardType(.numberPad)
                            .onChange(of: heightInches) { _, newValue in
                                heightInches = min(max(newValue, 0), 11)
                                
                                if heightFeet > 0 || heightInches > 0 {
                                    heightValue = Int(Double(heightFeet * 12 + heightInches) * 2.54)
                                } else {
                                    heightValue = 0
                                }
                            }
                        Spacer()
                        Text("in")
                        
                    }
                    .padding(20)
                    .modifier(CustomFrame())
                    
                } else {
                    HStack {
                        TextField("", value: $heightCm, format: .number)
                            .keyboardType(.numberPad)
                            .onChange(of: heightCm) { _, newValue in
                                heightValue = newValue
                                print(heightValue)
                            }
                        Spacer()
                        Text("cm")
                    }
                    .padding(20)
                    .modifier(CustomFrame())
                    
                }
                
                Text("Enter in your weight")
                    .font(.headline)
                    .frame(maxWidth: 290, alignment: .leading)
                    .foregroundStyle(.white)
                    .padding(.top, 10)
                
                if selectedUnit == "Imperial" {
                    HStack {
                        TextField("", value: $weightPounds, format: .number)
                            .keyboardType(.numberPad)
                            .onChange(of: weightPounds) { _, newValue in
                                let kg = Double(newValue) / 2.20462
                                weightValue = Int(round(kg))
                            }
                        Spacer()
                        Text("lb")
                    }
                    .padding(20)
                    .modifier(CustomFrame())
                    .padding(.top, 5)
                } else {
                    HStack {
                        TextField("", value: $weightKg, format: .number)
                            .keyboardType(.numberPad)
                            .onChange(of: weightKg) { _, newValue in
                                weightValue = newValue
                                print(weightValue)
                            }
                        Spacer()
                        Text("kg")
                    }
                    .padding(20)
                    .modifier(CustomFrame())
                    .padding(.top, 5)
                }
                
                Spacer()
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    NavigationLink {
                        ActivityInfo()
                    } label: {
                        Text("Continue")
                            .foregroundStyle(.black)
                            .frame(width: 290, height: 50)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .contentShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .disabled(heightValue == 0 || weightValue == 0)
                }
                .padding(.bottom, 20)
                
            }
        }
        .navigationBarTitle("Units & Body Stats")
    }
}

#Preview {
    UnitsAndBodyStats()
}
