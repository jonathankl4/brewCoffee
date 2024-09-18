//
//  DashboardView.swift
//  brewCoffee
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI

struct DashboardView: View {
    @State private var isNotificationEnabled = false
    @State private var showSheet = false
    
    @State private var showAddRecord = false
    @State private var showLogDetail = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        SummaryCard(img: "cup.and.saucer.fill", jml: "100", ket: "Caffeine (mg)")
                        SummaryCard(img: "cup.and.saucer.fill", jml: "100", ket: "Caffeine (mg)")
                        SummaryCard(img: "cup.and.saucer.fill", jml: "100", ket: "Caffeine (mg)")
                        SummaryCard(img: "cup.and.saucer.fill", jml: "100", ket: "Caffeine (mg)")
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
                                Text("Add Record")
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
                            AddRecordModalView(isNotificationEnabled: $isNotificationEnabled, showAddRecord: $showAddRecord)
                        }
                    }
                    
                    VStack {
                        CurrentCoffeeCard(name: "Mocha Latte", time: "11.47 a.m", jml: "68 mg")
                        
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
                                .font(.title2) // Ukuran icon
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

struct AddRecordModalView: View {
    @Binding var isNotificationEnabled: Bool
    @Binding var showAddRecord: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Halo")
            }
            .navigationTitle("Add Record")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        showAddRecord = false
                    }
                    .foregroundColor(Color.warnacoklat)
                }
            }
        }
    }
}

#Preview {
    DashboardView()
}
