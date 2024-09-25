//
//  DashboardView.swift
//  brewCoffee
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI
import SwiftData

struct DashboardView: View {
    @Query var coffeeRecord: [RecordsCoffee]
    @State private var isNotificationEnabled = true
    @State private var showSheet = false
    
    @State private var showAddRecord = false
    @State private var showLogDetail = false
    
    var body: some View {
        // Filter record yang waktunya hari ini
        let todayRecords = coffeeRecord.filter { record in
            Calendar.current.isDateInToday(record.date)
        }
        
        // Menghitung total kafein hari ini
        let totalCaffeineToday = todayRecords.reduce(0) { total, record in
            total + record.caffeineCoffee
        }
        
        // Menghitung jumlah kopi hari ini
        let totalCoffeesToday = todayRecords.count
        
        // Mendapatkan waktu terakhir minum kopi
        let lastCoffeeTime = todayRecords.sorted(by: { $0.time > $1.time }).first?.time
        
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        SummaryCard(img: "cup.and.saucer.fill", jml: "\(Int(totalCaffeineToday))/200", ket: "Today's Caffeine")
                        SummaryCard(img: "cup.and.saucer.fill", jml: "\(totalCoffeesToday)", ket: "Today's Coffee")
                        SummaryCard(img: "clock.fill", jml: lastCoffeeTime != nil ? formattedTime(from: lastCoffeeTime!) : "-", ket: "Current Coffee")
                        SummaryCard(img: "clock.badge.checkmark.fill", jml: nextCoffeeTimeFormat(from: lastCoffeeTime), ket: "Next Coffee")
                    }
                    .padding(.bottom, 20)
                    
                    
                    Text("Caffeine Today")
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                    
                    VStack {
                        GraphCaffeine()
                    }
                    .padding(.bottom, 20)
                    
                    HStack {
                        Text("Current Coffee")
                            .font(.title2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .bold()
                        
                        Button(action: {
                            showAddRecord = true
                        }) {
                            HStack {
                                Image(systemName: "plus")
                                Text("Add Records")
                            }
                            .font(.system(size: 14))
                            .bold()
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(Color.warnacoklat)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                        }
                        .sheet(isPresented: $showAddRecord) {
                            AddRecordView()
                        }
                    }
                    
                    VStack {
                        if todayRecords.isEmpty {
                            HStack {
                                Text("Add the record to see your current coffee")
                                    .font(.system(size: 15))
                                    .foregroundColor(.brown)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .padding()
                            .frame(height: 60)
                            .background(Color.cokelatMuda)
                            .cornerRadius(15)
                        } else {
                            ForEach(todayRecords) { record in
                                CurrentCoffeeCard(coffeeRecord: record)
                            }
                        }
                    }
                    
                    Button(action: {
                        showLogDetail = true
                    }, label: {
                        Text("Log Detail")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .foregroundColor(.brown)
                    })
                    .sheet (isPresented: $showLogDetail) {
                        HistoryLogView()
                    }
                    
                }
                .padding()
                .navigationTitle("Dashboard")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showSheet = true
                        }) {
                            Image(systemName: "bell.fill")
                                .font(.title2)
                                .foregroundColor(Color.warnacoklat)
                        }
                    }
                }
                .sheet(isPresented: $showSheet) {
                    NotificationSettingsView(isNotificationEnabled: $isNotificationEnabled, showSheet: $showSheet)
                        .presentationDetents([.fraction(0.25)])
                }
                .onAppear {
                    // Update notification when view appears
                    updateNextCoffeeNotification()
                }
                .onAppear {
                    UNUserNotificationCenter.current().delegate = NotificationManager.shared
                    updateNextCoffeeNotification() // Memastikan notifikasi diupdate saat view muncul
                }
                .onChange(of: coffeeRecord) { _ in
                    // Update notification when records change
                    updateNextCoffeeNotification()
                }
            }
        }
    }
    
    // Fungsi baru yang mengatur jadwal notifikasi
    func updateNextCoffeeNotification() {
        if let lastTime = coffeeRecord.sorted(by: { $0.time > $1.time }).first?.time {
            // Misalnya pengguna boleh minum kopi lagi setelah 3 jam
            let nextTime = Calendar.current.date(byAdding: .minute, value: 1, to: lastTime)
            if let nextCoffeeTime = nextTime {
                scheduleNextCoffeeNotification(at: nextCoffeeTime)
            }
        } else {
            print("Belum ada record kopi untuk hari ini")
        }
    }
    
    func formattedTime(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.timeZone = TimeZone.current
        return formatter.string(from: date)
    }
    
    func nextCoffeeTimeFormat(from lastCoffeeTime: Date?) -> String {
        guard let lastCoffeeTime = lastCoffeeTime,
              let nextTime = Calendar.current.date(byAdding: .minute, value: 1, to: lastCoffeeTime) else {
            return "-"
        }
        return formattedTime(from: nextTime)
    }
    
    func scheduleNextCoffeeNotification(at nextTime: Date) {
        let content = UNMutableNotificationContent()
        content.title = "It's Coffee Time!"
        content.body = "You can now enjoy your next coffee."
        content.sound = UNNotificationSound.default
        
        // Konversi nextTime ke timezone lokal
        let localNextTime = Calendar.current.date(bySetting: .second, value: 0, of: nextTime) ?? nextTime
        let timeInterval = localNextTime.timeIntervalSinceNow
        guard timeInterval > 0 else {
            print("Error: nextTime is in the past")
            return
        }
        
        print("Scheduling notification for \(localNextTime) with interval \(timeInterval) seconds")

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled successfully for \(localNextTime)")
            }
        }
    }
}

struct NotificationSettingsView: View {
    @Binding var isNotificationEnabled: Bool
    @Binding var showSheet: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Toggle("Enable Notifications", isOn: $isNotificationEnabled)
                        .onChange(of: isNotificationEnabled) { isEnabled in
                            if isEnabled {
                                requestNotificationPermission()
                            } else {
                                disableNotifications()
                            }
                        }
                        .padding()
                        .tint(Color.warnacoklat)
                }
                .listRowBackground(Color.cokelatMuda)
            }
            .navigationTitle("Notification Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        showSheet = false
                    }
                    .foregroundColor(Color.warnacoklat)
                }
            }
        }
        .background(Color.cokelatMuda)
    }
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Notification permission error: \(error.localizedDescription)")
            }
            isNotificationEnabled = granted
        }
    }
    
    func disableNotifications() {
        // Ini adalah tempat Anda menonaktifkan notifikasi yang sebelumnya dijadwalkan
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}

#Preview {
    DashboardView()
}
