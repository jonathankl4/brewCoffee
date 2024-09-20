//
//  CoffeeDetailSheetView.swift
//  brewCoffee
//
//  Created by MacBook Air on 19/09/24.
//

import SwiftUI

struct CoffeeDetailSheetView: View {
    var coffee: Coffee

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Body Caffeine").padding(.leading, -12.5).bold()) {
                    HStack {
                        Text("The amount of caffeine present in your body after consumption.")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("66 mg")
                    }
                }
                
                Section(header: Text("Caffeine Limit").padding(.leading, -12.5).bold()) {
                    HStack {
                        Text("The amount of caffeine still in the body after initial consumption that is considered safe.")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("66/200 mg")
                    }
                }
                
                Section(header: Text("Details").padding(.leading, -12.5).bold()) {
                    HStack {
                        Text("Name")
                          Spacer()
                            
                        Text("\(coffee.name ?? "Unknown")")
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Brand")
                          Spacer()
                            
                        Text("\(coffee.brand ?? "Unknown")")
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Size")
                          Spacer()
                            
                        Text("\(coffee.size)")
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Time")
                          Spacer()
                            
                        Text("\(coffee.date ?? "Unknown") at \(coffee.time ?? "Unknown")")
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Gram")
                          Spacer()
                            
                        Text("\(Int(coffee.coffeeGram))")
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Water")
                          Spacer()
                            
                        Text("\(Int(coffee.water))")
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
            .navigationTitle("Caffeine Record")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
