//
//  RecordResultView.swift
//  brewCoffee
//
//  Created by MacBook Air on 20/09/24.
//

import SwiftUI
import SwiftData

struct RecordResultView: View {
    @EnvironmentObject var caffeineData: CaffeineManager
    @Query var coffeeToday: [RecordsCoffee]
    var coffeeRecord: RecordsCoffee
    
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showConfirmationAlert = false
    @State private var isRecordAdded = false
    
    @Environment(\.modelContext) private var context
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: coffeeRecord.date)
    }

    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: coffeeRecord.time)
    }
    
    var totalCaffeinePreview: Double {
        let todayRecords = coffeeToday.filter { record in
            Calendar.current.isDateInToday(record.date)
        }
        
        if todayRecords.isEmpty {
            return coffeeRecord.caffeineCoffee
        } else {
            return todayRecords.reduce(0) { total, record in
                total + caffeineData.currentCaffeine
            } + coffeeRecord.caffeineCoffee
        }
    }
    
    var totalCaffeineToday: Double {
        let todayRecords = coffeeToday.filter { record in
            Calendar.current.isDateInToday(record.date)
        }
        
        return todayRecords.reduce(0) { total, record in
            total + record.caffeineCoffee
        }
    }
    
    var nextAllowedCoffeeTime: Date? {
        let todayRecords = coffeeToday.filter { record in
            Calendar.current.isDateInToday(record.date)
        }
        
        if let lastCoffeeTime = todayRecords.sorted(by: { $0.time > $1.time }).first?.time {
            return Calendar.current.date(byAdding: .hour, value: 5, to: lastCoffeeTime)
        }
        
        return nil
    }
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section(header: Text("Body Caffeine").padding(.leading, -12.5).bold().foregroundColor(Color.warnacoklat)) {
                    HStack {
                        Text("The amount of caffeine present in your body after consumption.")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("\(Int(coffeeRecord.caffeineCoffee)) mg")
                    }
                }
                
                Section(header: Text("Caffeine Limit").padding(.leading, -12.5).bold().foregroundColor(Color.warnacoklat)) {
                    HStack {
                        Text("The amount of caffeine still in the body after initial consumption that is considered safe.")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("\(Int(isRecordAdded ? totalCaffeineToday : totalCaffeinePreview))/200 mg")
                    }
                }
                
                Section(header: Text("Details").padding(.leading, -12.5).bold().foregroundColor(Color.warnacoklat)) {
                    HStack {
                        Text("Name")
                          Spacer()
                            
                        Text(coffeeRecord.name)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Size")
                          Spacer()
                            
                        Text(coffeeRecord.size)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Date")
                          Spacer()
                        Text("\(formattedDate)")
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Time")
                          Spacer()
                        Text("\(formattedTime)")
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Coffee")
                          Spacer()
                            
                        Text("\(Int(coffeeRecord.coffeeAmount)) mg")
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Water")
                          Spacer()
                            
                        Text("\(Int(coffeeRecord.waterAmount)) ml")
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
            .navigationTitle("Caffeine Record")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        if totalCaffeineToday > 200 {
                            showConfirmationAlert = true
                        } else {
                            saveRecord()
                        }
                    }) {
                        HStack(spacing: 3) {
                            Text("Add")
                                .bold()
                            Image(systemName: "chevron.right")
                                .bold()
                        }
                    }
                    .foregroundColor(Color.warnacoklat)
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(alertTitle),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("OK"), action: {
                        if alertTitle == "Success" {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                dismissToRoot()
                            }
                        }
                    })
                )
            }
            .alert("Caffeine Limit Exceeded", isPresented: $showConfirmationAlert, actions: {
                Button("Cancel", role: .cancel) { }
                Button("Proceed", role: .destructive) {
                    let newRecord = coffeeRecord
                    context.insert(newRecord)
                    do {
                        try context.save()
                        alertTitle = "Success"
                        alertMessage = "Record added successfully."
                        showAlert = true
                        isRecordAdded = true
                    } catch {
                        alertTitle = "Error"
                        alertMessage = "Failed to save record: \(error.localizedDescription)"
                        showAlert = true
                    }
                }
            }, message: {
                Text("The total caffeine consumption exceeds the safe limit. Are you sure you want to proceed?")
            })
        }
    }
    
    func saveRecord() {
        if let nextTime = nextAllowedCoffeeTime, coffeeRecord.time < nextTime {
            alertTitle = "Too Soon!"
            alertMessage = "You can only add a coffee record after \(formattedTime(from: nextTime))."
            showAlert = true
            return
        }
        let updatedCaffeineToday = totalCaffeineToday + coffeeRecord.caffeineCoffee
        
        if updatedCaffeineToday > 200 {
            alertTitle = "Warning"
            alertMessage = "The total caffeine consumption exceeds the safe limit."
            showConfirmationAlert = true
        } else {
            let newRecord = coffeeRecord
            context.insert(newRecord)
            do {
                try context.save()
                alertTitle = "Success"
                alertMessage = "Record added successfully."
                showAlert = true
                isRecordAdded = true
            } catch {
                alertTitle = "Error"
                alertMessage = "Failed to save record: \(error.localizedDescription)"
                showAlert = true
            }
        }
    }
    
    func formattedTime(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.timeZone = TimeZone.current
        return formatter.string(from: date)
    }
    
    func dismissToRoot() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            windowScene.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
        }
    }
}

//#Preview {
//    RecordResultView(
//        name: "Americano",
//        size: "1 Cup",
//        time: Date(),
//        date: Date(),
//        caffeineCoffee: 66,
//        coffeeAmount: 100,
//        waterAmount: 1000
//    )
//}
