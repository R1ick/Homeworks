//
//  TimerSwiftUIApp.swift
//  TimerSwiftUI
//
//  Created by Martynov Evgeny on 5.04.22.
//

import SwiftUI

@main
struct TimerSwiftUIApp: App {
    
    @StateObject private var user = UserManager()
    
    var body: some Scene {
        
        WindowGroup {
//            ContentView()
            StarterView()
                .environmentObject(user)
        }
    }
}
