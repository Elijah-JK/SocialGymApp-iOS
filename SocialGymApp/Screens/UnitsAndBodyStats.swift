//
//  UnitsAndBodyStats.swift
//  SocialGymApp
//
//  Created by Elijah K on 11/14/25.
//

import SwiftUI

// work on imperial
// inches needs to be validated (0-11)
// then convert imperial to metric (useful for storing data in metric)
// refactor, separate views
struct UnitsAndBodyStats: View {
    @State private var selectedUnit: String = "Imperial"
    @State private var heightCm: String = ""
    @State private var weightKg: String = ""
    
    @State private var heightFeet: String = ""
    @State private var heightInches: String = ""
    @State private var weightPounds: String = ""
    
    let units = ["Imperial", "Metric"]
    var heightValue: Double { Double(heightCm) ?? 0 }
    var weightValue: Double { Double(weightKg) ?? 0 }
    
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
                .padding(15)
                .modifier(CustomFrame())
                .tint(.teal)
                
                Text("Enter in your body stats below")
                    .font(.headline)
                    .frame(maxWidth: 290, alignment: .leading)
                    .foregroundStyle(.white)
                    .padding(.top, 10)
                
                if selectedUnit == "Imperial" {
                    HStack {
                        TextField("", text: $heightFeet, prompt: Text("Feet").foregroundStyle(.gray))
                            .keyboardType(.numberPad)
                        Spacer()
                        Text("ft")
                        
                        Rectangle()
                            .fill(Color.gray.opacity(0.4))
                            .frame(width: 1, height: 24)
                            .padding(.horizontal, 8)
                        
                        TextField("", text: $heightInches, prompt: Text("Inches").foregroundStyle(.gray))
                            .keyboardType(.numberPad)
                        Spacer()
                        Text("in")
                        
                    }
                    .padding(20)
                    .modifier(CustomFrame())
                    
                    HStack {
                        TextField("", text: $weightPounds, prompt: Text("Enter in your weight").foregroundStyle(.gray))
                            .keyboardType(.decimalPad)
                        Spacer()
                        Text("lb")
                    }
                    .padding(20)
                    .modifier(CustomFrame())
                    .padding(.top, 5)
                    
                } else {
                    HStack {
                        TextField("", text: $heightCm, prompt: Text("Enter in your height").foregroundStyle(.gray))
                            .keyboardType(.decimalPad)
                        Spacer()
                        Text("cm")
                    }
                    .padding(20)
                    .modifier(CustomFrame())
                    
                    HStack {
                        TextField("", text: $weightKg, prompt: Text("Enter in your weight").foregroundStyle(.gray))
                            .keyboardType(.decimalPad)
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
                        LoginScreen()
                    } label: {
                        Text("Continue")
                            .foregroundStyle(.black)
                            .frame(width: 290, height: 50)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .contentShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .disabled(heightValue != 0 || weightValue != 0)
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
