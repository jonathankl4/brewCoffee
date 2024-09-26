//
//  FormRecordView.swift
//  brewCoffee
//
//  Created by MacBook Air on 19/09/24.
//

import SwiftUI

struct FormRecordView: View {
    @EnvironmentObject var caffeineData: CaffeineManager
    var coffeeName: String
    var caffeineCoffee: Double
    var iconCoffee: String
    
    @State private var enteredName: String
    @State private var selectedSizeCoffee: String = "1 Cup"
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    
    @State private var isCalendarEnabled = false
    @State private var isTimeEnabled = false
    
    let coffeeBase: Double = 13.0
    let waterBase: Double = 208.0
    
    var sizeCoffee: [String] {
        ["¼ Cup", "½ Cup", "¾ Cup", "1 Cup", "1½ Cup", "2 Cup"]
    }

    init(coffeeName: String, caffeineCoffee: Double, iconCoffee: String) {
        self.coffeeName = coffeeName
        self.caffeineCoffee = caffeineCoffee
        self.iconCoffee = iconCoffee
        _enteredName = State(initialValue: coffeeName)
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
        case "¼ Cup": return caffeineCoffee * 0.25
        case "½ Cup": return caffeineCoffee * 0.5
        case "¾ Cup": return caffeineCoffee * 0.75
        case "1½ Cup": return caffeineCoffee * 1.5
        case "2 Cup": return caffeineCoffee * 2.0
        default: return caffeineCoffee
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
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        RecordResultView(
                            coffeeRecord: RecordsCoffee(
                                name: enteredName,
                                size: selectedSizeCoffee,
                                date: isTimeEnabled ? selectedDate : Date(),
                                time: isTimeEnabled ? selectedTime : Date(),
                                coffeeAmount: coffeeAmount,
                                caffeineCoffee: calculatedCaffeine,
                                waterAmount: waterAmount,
                                iconCoffee: iconCoffee,
                                caffeineBase: caffeineCoffee
                            )
                        )
                    } label: {
                        HStack(spacing: 3) {
                           Text("Next")
                               .bold()
                           Image(systemName: "chevron.right")
                               .bold()
                       }
                    }
                    .foregroundColor(Color.warnacoklat)
                }
            }
        }
        .accentColor(Color.warnacoklat)
    }
}

//#Preview {
//    FormRecordView(coffeeName: "Americano", caffeineCoffee: 200)
//}
