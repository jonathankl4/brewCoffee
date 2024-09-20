//
//  DrinkTimeSectionView.swift
//  brewCoffee
//
//  Created by MacBook Air on 19/09/24.
//

import SwiftUI

struct CoffeeDrinkTimeSectionView: View {
    @Binding var isCalendarEnabled: Bool
    @Binding var selectedDate: Date
    @Binding var isTimeEnabled: Bool
    @Binding var selectedTime: Date

    var body: some View {
        Section(header: Text("Drink Time").padding(.leading, -12.5).bold()) {
            Toggle(isOn: $isCalendarEnabled) {
                HStack {
                    Image(systemName: "calendar")
                    Text("Date")
                }
            }

            if isCalendarEnabled {
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
            }

            Toggle(isOn: $isTimeEnabled) {
                HStack {
                    Image(systemName: "clock")
                    Text("Time")
                }
            }

            if isTimeEnabled {
                DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
            }
        }
    }
}
