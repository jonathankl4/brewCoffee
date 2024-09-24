//
//  brewCoffeeApp.swift
//  brewCoffee
//
//  Created by MacBook Air on 15/09/24.
//

import SwiftUI

@main
struct brewCoffeeApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .modelContainer(for: RecordsCoffee.self)
        }
    }
}
