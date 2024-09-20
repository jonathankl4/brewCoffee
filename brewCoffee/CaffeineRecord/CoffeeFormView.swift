//
//  CoffeeFormView.swift
//  brewCoffee
//
//  Created by MacBook Air on 19/09/24.
//

import SwiftUI

struct CoffeeFormView: View {
    @Binding var name: String
    @Binding var brand: String
    @Binding var date: String
    @Binding var time: String
    @Binding var coffeeGram: Int
    @Binding var water: Int
    @Binding var selectedSizeCoffee: String
    
    @State private var isCalendarEnabled = false
    @State private var isTimeEnabled = false
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    
    var onCancel: () -> Void
    var onSave: () -> Void

    var body: some View {
        NavigationView {
            Form {
                CoffeeDetailsSectionView(name: $name, brand: $brand, selectedSizeCoffee: $selectedSizeCoffee)
                CoffeeMixtureSectionView(selectedSizeCoffee: $selectedSizeCoffee, coffeeGram: $coffeeGram, water: $water)
                CoffeeDrinkTimeSectionView(isCalendarEnabled: $isCalendarEnabled, selectedDate: $selectedDate, isTimeEnabled: $isTimeEnabled, selectedTime: $selectedTime)
            }
            .navigationTitle("Caffeine Record")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button("Cancel", action: onCancel), trailing: Button("Done") {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "d MMMM yyyy"
                date = isCalendarEnabled ? dateFormatter.string(from: selectedDate) : ""
                
                let timeFormatter = DateFormatter()
                timeFormatter.timeStyle = .short
                time = isTimeEnabled ? timeFormatter.string(from: selectedTime) : ""
                
                // Debugging log
                print("Selected Size Coffee in CoffeeFormView: \(selectedSizeCoffee)")
                
                onSave()
            })
        }
    }
}
