//
//  FormRecordView.swift
//  brewCoffee
//
//  Created by MacBook Air on 19/09/24.
//

import SwiftUI

struct FormRecordView: View {
    var coffeeName: String
    var caffeineCoffee: Double
    
    @State private var enteredName: String

    init(coffeeName: String, caffeineCoffee: Double) {
        self.coffeeName = coffeeName
        self.caffeineCoffee = caffeineCoffee
        _enteredName = State(initialValue: coffeeName)
    }
    
    @State private var coffeeBrand = ""
    @State private var selectedSizeCoffee: String = "1x"
    @State private var coffeeGram = 0.0
    @State private var coffeeWater = 0.0
    @State private var coffeeDate = ""
    @State private var coffeeTime = ""
    
    @State private var isCalendarEnabled = false
    @State private var isTimeEnabled = false
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    
    
    let coffeeBase: Double = 13.0
    let waterBase: Double = 208.0
    
    var sizeCoffee: [String] {
        ["¼x", "½x", "¾x", "1x", "1½x", "2x"]
    }
    
    var coffeeAmount: Double {
        switch selectedSizeCoffee {
        case "¼x": return coffeeBase * 0.25
        case "½x": return coffeeBase * 0.5
        case "¾x": return coffeeBase * 0.75
        case "1x": return coffeeBase
        case "1½x": return coffeeBase * 1.5
        case "2x": return coffeeBase * 2.0
        default: return coffeeBase
        }
    }
    
    var waterAmount: Double {
        switch selectedSizeCoffee {
        case "¼x": return waterBase * 0.25
        case "½x": return waterBase * 0.5
        case "¾x": return waterBase * 0.75
        case "1x": return waterBase
        case "1½x": return waterBase * 1.5
        case "2x": return waterBase * 2.0
        default: return waterBase
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
                            .onChange(of: selectedSizeCoffee) { newSize in
                                coffeeGram = (Double(coffeeAmount))
                            }
                    }

                    HStack {
                        Text("Water (ml)")
                        Spacer()
                        Text("\(Int(waterAmount)) ml")
                            .onChange(of: selectedSizeCoffee) { newSize in
                                coffeeWater = (Double(waterAmount))
                            }
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
                        RecordResultView()
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

#Preview {
    FormRecordView(coffeeName: "Americano", caffeineCoffee: 200)
}
