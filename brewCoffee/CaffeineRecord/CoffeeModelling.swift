//
//  CoffeeModelling.swift
//  brewCoffee
//
//  Created by MacBook Air on 19/09/24.
//

import Foundation

// The model handles the data-related logic
class CoffeeModelling {
    private let coreDataManager = CoreDataManager.shared
    
    func saveCoffee(name: String, brand: String, size: Int, date: String, time: String, coffeeGram: Int, water: Int) {
        coreDataManager.saveCoffee(name: name, brand: brand, size: size, date: date, time: time, coffeeGram: coffeeGram, water: water)
    }
    
    func fetchAllCoffee() -> [Coffee] {
        return coreDataManager.fetchAllCoffee()
    }
}
