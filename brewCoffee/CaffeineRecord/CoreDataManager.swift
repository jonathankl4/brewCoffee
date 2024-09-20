//
//  CoreDataManager.swift
//  brewCoffee
//
//  Created by MacBook Air on 19/09/24.
//

import CoreData
import Foundation

// Core Data manager responsible for interacting with the persistent store
class CoreDataManager {
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "CoffeeModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data: \(error)")
            }
        }
    }
    
    // Save coffee to Core Data
    func saveCoffee(name: String, brand: String, selectedSizeCoffee: String, date: String, time: String, coffeeGram: Int, water: Int) {
        let context = persistentContainer.viewContext
        let coffee = Coffee(context: context)
        
        coffee.name = name.isEmpty ? "Unknown" : name
        coffee.brand = brand.isEmpty ? "Unknown" : brand
        coffee.selectedSizeCoffee = selectedSizeCoffee.isEmpty ? "Unknown" : selectedSizeCoffee
        coffee.date = date.isEmpty ? "Unknown" : date
        coffee.time = time.isEmpty ? "Unknown" : time
        coffee.coffeeGram = Int16(coffeeGram)
        coffee.water = Int16(water)
        
        do {
            try context.save()
            print("Coffee saved successfully!")
            print("\(coffee.name ?? "Unknown"), \(coffee.brand ?? "Unknown"), \(coffee.selectedSizeCoffee ?? "Unknown"), \(coffee.date ?? "Unknown"), \(coffee.time ?? "Unknown"), \(coffee.coffeeGram), \(coffee.water)")
        } catch {
            print("Failed to save coffee: \(error)")
        }
    }
    
    // Fetch all coffee records
    func fetchAllCoffee() -> [Coffee] {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Coffee> = Coffee.fetchRequest()
        
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch coffee: \(error)")
            return []
        }
    }
}
