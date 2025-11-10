//
//  SocialGymAppApp.swift
//  SocialGymApp
//
//  Created by Elijah K on 11/10/25.
//

import SwiftUI

@main
struct SocialGymAppApp: App {
    @State private var currentScreen: CurrentScreen = CurrentScreen.login
    
    var body: some Scene {
        WindowGroup {
            switch currentScreen {
            case .login:
                LoginScreen()
            case .main:
                ContentView()
            }
        }
    }
}

enum CurrentScreen {
    case login, main
}
