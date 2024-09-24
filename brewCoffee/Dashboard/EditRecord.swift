//
//  EditRecord.swift
//  brewCoffee
//
//  Created by MacBook Air on 22/09/24.
//

import SwiftUI

struct EditRecord: View {
    @Binding var coffeeRecord: RecordsCoffee
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var enteredName: String
    @State private var selectedSizeCoffee: String
    @State private var selectedDate: Date
    @State private var selectedTime: Date
    @State private var caffeineBase: Double
    @State private var isCalendarEnabled = false
    @State private var isTimeEnabled = false
    
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    let coffeeBase: Double = 13.0
    let waterBase: Double = 208.0

    var sizeCoffee: [String] {
        ["¼ Cup", "½ Cup", "¾ Cup", "1 Cup", "1½ Cup", "2 Cup"]
    }
    
    init(coffeeRecord: Binding<RecordsCoffee>) {
        self._coffeeRecord = coffeeRecord
        _enteredName = State(initialValue: coffeeRecord.wrappedValue.name)
        _selectedSizeCoffee = State(initialValue: coffeeRecord.wrappedValue.size)
        _selectedDate = State(initialValue: coffeeRecord.wrappedValue.date)
        _selectedTime = State(initialValue: coffeeRecord.wrappedValue.time)
        _caffeineBase = State(initialValue: coffeeRecord.wrappedValue.caffeineBase)
    }

    var coffeeAmount: Double {
        switch selectedSizeCoffee {
        case "¼ Cup": return coffeeBase * 0.25
        case "½ Cup": return coffeeBase * 0.5
        case "¾ Cup": return coffeeBase * 0.75
        case "1 Cup": return coffeeBase
        case "1½ Cup": return coffeeBase * 1.5
        case "2 Cup": return coffeeBase * 2.0
        default: return coffeeBase
        }
    }

    var waterAmount: Double {
        switch selectedSizeCoffee {
        case "¼ Cup": return waterBase * 0.25
        case "½ Cup": return waterBase * 0.5
        case "¾ Cup": return waterBase * 0.75
        case "1 Cup": return waterBase
        case "1½ Cup": return waterBase * 1.5
        case "2 Cup": return waterBase * 2.0
        default: return waterBase
        }
    }

    var calculatedCaffeine: Double {
        switch selectedSizeCoffee {
        case "¼ Cup": return caffeineBase * 0.25
        case "½ Cup": return caffeineBase * 0.5
        case "¾ Cup": return caffeineBase * 0.75
        case "1½ Cup": return caffeineBase * 1.5
        case "2 Cup": return caffeineBase * 2.0
        default: return caffeineBase
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("My Coffee")
                    .padding(.leading, -12.5)
                    .bold()
                    .foregroundColor(Color.warnacoklat)) {
                    HStack {
                        Text("Name")
                        Spacer()
                        TextField("Add Name", text: $enteredName)
                            .multilineTextAlignment(.trailing)
                    }

                    HStack {
                        Picker("Size", selection: $selectedSizeCoffee) {
                            ForEach(sizeCoffee, id: \.self) { size in
                                Text(size)
                            }
                        }
                    }
                }

                Section(header: Text("Coffee Mixtures")
                    .padding(.leading, -12.5)
                    .bold()
                    .foregroundColor(Color.warnacoklat)) {
                    HStack {
                        Text("Coffee (mg)")
                        Spacer()
                        Text("\(Int(coffeeAmount)) mg")
                    }

                    HStack {
                        Text("Water (ml)")
                        Spacer()
                        Text("\(Int(waterAmount)) ml")
                    }
                }

                Section(header: Text("Drink Time")
                    .padding(.leading, -12.5)
                    .bold().foregroundColor(Color.warnacoklat)) {
                    Toggle(isOn: $isCalendarEnabled) {
                        HStack {
                            Image(systemName: "calendar")
                            Text("Date")
                        }
                    }
                    .tint(Color.warnacoklat)

                    if isCalendarEnabled {
                        DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                    }

                    Toggle(isOn: $isTimeEnabled) {
                        HStack {
                            Image(systemName: "clock")
                            Text("Time")
                        }
                    }
                    .tint(Color.warnacoklat)

                    if isTimeEnabled {
                        DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    }
                }
            }
            .navigationTitle("Caffeine Record")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    }
                    .foregroundColor(Color.warnacoklat)
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        saveChanges()
                    }, label: {
                           Text("Update")
                               .bold()
                    })
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
        .accentColor(Color.warnacoklat)
    }
    
    private func saveChanges() {
        print("Attempting to save changes")
        coffeeRecord.name = enteredName
        coffeeRecord.size = selectedSizeCoffee
        coffeeRecord.date = selectedDate
        coffeeRecord.time = selectedTime
        coffeeRecord.caffeineCoffee = calculatedCaffeine
        coffeeRecord.coffeeAmount = coffeeAmount
        coffeeRecord.waterAmount = waterAmount
        
        do {
            try modelContext.save()
            alertTitle = "Success"
            alertMessage = "Record updated successfully."
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
//    EditRecord()
//}
