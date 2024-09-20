//
//  CoffeeDrinks.swift
//  brewCoffee
//
//  Created by MacBook Air on 19/09/24.
//

import Foundation

struct CoffeeDrinks: Identifiable {
    var id: UUID = UUID()
    var nameCoffee: String
    var iconCoffee: String
    var caffeineCoffee: Double
}

extension CoffeeDrinks {
    static var dummies: [CoffeeDrinks] = [
        CoffeeDrinks(nameCoffee: "Americano", iconCoffee: "americano", caffeineCoffee: 20),
        CoffeeDrinks(nameCoffee: "Caffe Latte", iconCoffee: "caffe_latte", caffeineCoffee: 30),
        CoffeeDrinks(nameCoffee: "Cappucino", iconCoffee: "cappucino", caffeineCoffee: 40),
        CoffeeDrinks(nameCoffee: "Cold Brew", iconCoffee: "cold_brew", caffeineCoffee: 50),
        CoffeeDrinks(nameCoffee: "Espresso", iconCoffee: "espresso", caffeineCoffee: 60),
        CoffeeDrinks(nameCoffee: "Long Black", iconCoffee: "long_black", caffeineCoffee: 70),
        CoffeeDrinks(nameCoffee: "Macchiato", iconCoffee: "macchiato", caffeineCoffee: 45),
        CoffeeDrinks(nameCoffee: "Mocha Latte", iconCoffee: "mocha_latte", caffeineCoffee: 32),
        CoffeeDrinks(nameCoffee: "Vanila Latte", iconCoffee: "vanila_latte", caffeineCoffee: 3),
    ]
}
