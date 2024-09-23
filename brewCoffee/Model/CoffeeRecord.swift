//
//  CoffeeRecord.swift
//  brewCoffee
//
//  Created by MacBook Air on 21/09/24.
//

import Foundation
import SwiftData

@Model
final class CoffeeRecords {
    @Attribute(.unique) var id: UUID
    var name: String
    var size: String
    var date: Date
    var time: Date
    var coffeeAmount: Double
    var caffeineCoffee: Double
    var waterAmount: Double
    var iconCoffee: String

    init(name: String, size: String, date: Date, time: Date, coffeeAmount: Double, caffeineCoffee: Double, waterAmount: Double, iconCoffee: String) {
        self.id = UUID()
        self.name = name
        self.size = size
        self.date = date
        self.time = time
        self.coffeeAmount = coffeeAmount
        self.caffeineCoffee = caffeineCoffee
        self.waterAmount = waterAmount
        self.iconCoffee = iconCoffee
    }
}
