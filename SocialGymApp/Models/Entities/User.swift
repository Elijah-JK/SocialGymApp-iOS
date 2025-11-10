//
//  User.swift
//  SocialGymApp
//
//  Created by Elijah K on 11/10/25.
//

import Foundation

struct User: Identifiable {
    let id: UUID
    let DOB: Date
    
    var firstName: String
    var lastName: String
    var email: String
    var username: String
    var bio: String?
    var isPrivate: Bool
    var joinedDate: Date
    
    var followers: [UUID]
    var following: [UUID]
    
    var height: Double?
    var weight: Double?
    var gender: Gender
    
    var maxBenchPress: Double?
    var maxDeadlift: Double?
    var maxSquat: Double?
    
    var activityLevel: ActivityLevel
    var fitnessGoal: [FitnessGoal]
    var preferredUnitSystem: UnitSystem
    var experienceLevel: ExperienceLevel
    
    // location
    // profile image
    // posts
    // computed methods are needed
}
