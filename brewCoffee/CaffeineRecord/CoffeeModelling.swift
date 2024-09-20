//
//  CoffeeModelling.swift
//  brewCoffee
//
//  Created by MacBook Air on 19/09/24.
//

import Foundation

class CoffeeModelling {
    private let coreDataManager = CoreDataManager.shared
    
    func saveCoffee(name: String, brand: String, selectedSizeCoffee: String, date: String, time: String, coffeeGram: Int, water: Int) {
        coreDataManager.saveCoffee(name: name, brand: brand, selectedSizeCoffee: selectedSizeCoffee, date: date, time: time, coffeeGram: coffeeGram, water: water)
    }
    
    func fetchAllCoffee() -> [Coffee] {
        return coreDataManager.fetchAllCoffee()
    }
}
