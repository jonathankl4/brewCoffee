//
//  CoffeeController.swift
//  brewCoffee
//
//  Created by MacBook Air on 19/09/24.
//

import Foundation

// This controller handles the interaction between the views and the model
class CoffeeController: ObservableObject {
    @Published var savedCoffees: [Coffee] = []
    @Published var selectedCoffee: Coffee?
    
    private let coffeeModel = CoffeeModelling()
    
    // Fetch coffee data
    func loadCoffeeData() {
        savedCoffees = coffeeModel.fetchAllCoffee()
    }
    
    // Add coffee data
    func addCoffee(name: String, brand: String, selectedSizeCoffee: String, date: String, time: String, coffeeGram: Int, water: Int) {
        coffeeModel.saveCoffee(name: name, brand: brand, selectedSizeCoffee: selectedSizeCoffee, date: date, time: time, coffeeGram: coffeeGram, water: water)
        loadCoffeeData() // Refresh data after saving
    }
}
