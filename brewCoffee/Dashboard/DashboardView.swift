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
    @State private var isNotificationEnabled = false
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
        let lastCoffeeTime = todayRecords.sorted(by: { $0.date > $1.date }).first?.date
        
        // Logic untuk menentukan Next Coffee
        let nextCoffeeTime: String = {
            if let lastTime = lastCoffeeTime {
                // Contoh: pengguna bisa minum kopi lagi 3 jam setelah minum terakhir
                let nextTime = Calendar.current.date(byAdding: .hour, value: 3, to: lastTime)
                let formatter = DateFormatter()
                formatter.timeStyle = .short
                return formatter.string(from: nextTime!)
            } else {
                return "-"
            }
        }()
        
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        SummaryCard(img: "cup.and.saucer.fill", jml: "\(Int(totalCaffeineToday))/200", ket: "Today's Caffeine")
                        SummaryCard(img: "cup.and.saucer.fill", jml: "\(totalCoffeesToday)", ket: "Today's Coffee")
                        SummaryCard(img: "clock.fill", jml: lastCoffeeTime != nil ? formattedTime(from: lastCoffeeTime!) : "-", ket: "Current Coffee")
                        SummaryCard(img: "clock.badge.checkmark.fill", jml: nextCoffeeTime, ket: "Next Coffee")
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
                                Text("Add Recordss")
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
            }
        }
    }
    
    func formattedTime(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
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
}

#Preview {
    DashboardView()
}
