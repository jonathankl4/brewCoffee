//
//  RecordResultView.swift
//  brewCoffee
//
//  Created by MacBook Air on 20/09/24.
//

import SwiftUI
import SwiftData

struct RecordResultView: View {
    var coffeeRecord: RecordsCoffee
    
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
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
                        Text("\(Int(coffeeRecord.caffeineCoffee))/200 mg")
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
                        saveRecord()
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
        }
    }
    
    func saveRecord() {
        
        let newRecord = coffeeRecord
        
        context.insert(newRecord)
        do {
            try context.save()
            alertTitle = "Success"
            alertMessage = "Record added successfully."
            showAlert = true
        } catch {
            alertTitle = "Error"
            alertMessage = "Failed to save record: \(error.localizedDescription)"
            showAlert = true
        }
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
