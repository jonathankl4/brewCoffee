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
    @Binding var size: Int
    @Binding var date: String
    @Binding var time: String
    @Binding var coffeeGram: Int
    @Binding var water: Int
    
    @State private var isCalendarEnabled = false
    @State private var isTimeEnabled = false
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    
    @State private var selectedSizeCoffee: String = "1x"
    
    var onCancel: () -> Void
    var onSave: () -> Void

    var body: some View {
        NavigationView {
            Form {
                CoffeeDetailSectionView(name: $name, brand: $brand, selectedSizeCoffee: $selectedSizeCoffee)
                
                // Pass the coffeeGram and water bindings to CoffeeMixturesSection
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
                
                onSave()
            })
        }
    }
}
