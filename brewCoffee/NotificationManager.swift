//
//  SwiftUIView.swift
//  brewCoffee
//
//  Created by MacBook Air on 25/09/24.
//

import SwiftUI
import UserNotifications

class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    static let shared = NotificationManager()

    // Minta izin notifikasi
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            print("Permission granted: \(granted)")
        }
        // Set delegate
        UNUserNotificationCenter.current().delegate = self
    }

    // Delegate untuk menampilkan notifikasi saat app sedang dibuka (foreground)
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Menampilkan notifikasi sebagai banner meskipun app terbuka
        completionHandler([.banner, .sound, .badge])
    }

    // Delegate untuk menangani notifikasi yang diketuk pengguna
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        print("Notification tapped!")
        completionHandler()
    }
}
