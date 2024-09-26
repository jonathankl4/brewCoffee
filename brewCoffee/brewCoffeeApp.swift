//
//  brewCoffeeApp.swift
//  brewCoffee
//
//  Created by MacBook Air on 15/09/24.
//

import SwiftUI
import UserNotifications

@main
struct brewCoffeeApp: App {
    @StateObject private var caffeineViewModel = CaffeineManager()
    init() {
            NotificationManager.shared.requestNotificationPermission()
    }
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .modelContainer(for: RecordsCoffee.self)
                .environmentObject(caffeineViewModel) 
        }
    }
}
