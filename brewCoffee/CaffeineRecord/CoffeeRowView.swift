//
//  CoffeeRowView.swift
//  brewCoffee
//
//  Created by MacBook Air on 19/09/24.
//

import SwiftUI

struct CoffeeRowView: View {
    var coffee: Coffee

    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: \(coffee.name ?? "Unknown")")
            Text("Brand: \(coffee.brand ?? "Unknown")")
            Text("Size: \(coffee.size)")
            Text("Date: \(coffee.date ?? "Unknown")")
            Text("Time: \(coffee.time ?? "Unknown")")
            Text("Gram: \(coffee.coffeeGram)")
            Text("Water: \(coffee.water)")
        }
    }
}
