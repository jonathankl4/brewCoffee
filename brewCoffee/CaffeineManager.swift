//
//  CaffeineManager.swift
//  brewCoffee
//
//  Created by MacBook Air on 25/09/24.
//

import SwiftUI

class CaffeineManager: ObservableObject {
    @Published var currentCaffeine: Double = 0.0
    private var timer: Timer?
    
    init() {
        startCaffeineReductionTimer()
    }
    
    func startCaffeineReductionTimer() {
        // Mulai timer untuk mengurangi kafein setiap menit
        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
            self.updateCaffeine()
        }
    }
    
    func stopCaffeineReductionTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateCaffeine() {
        let reductionPerMinute = 0.2301
        if currentCaffeine > 0 {
            currentCaffeine = max(currentCaffeine - reductionPerMinute, 0)
        }
    }
    
    func resetCaffeineValue(for records: [RecordsCoffee]) {
        let totalCaffeineWithoutReduction = records.reduce(0) { total, record in
            total + record.caffeineCoffee
        }
        currentCaffeine = totalCaffeineWithoutReduction - calculateCaffeineReduction(for: records)
    }
    
    func calculateCaffeineReduction(for records: [RecordsCoffee]) -> Double {
        var totalReduction: Double = 0.0
        let caffeineDecayRate: Double = 0.2301
        
        for record in records {
            let elapsedMinutes = Date().timeIntervalSince(record.time) / 60
            let reductionForRecord = caffeineDecayRate * elapsedMinutes
            totalReduction += min(record.caffeineCoffee, reductionForRecord)
        }
        
        return totalReduction
    }
    
    func timeUntilCaffeineBelowThreshold(totalCaffeine: Double, latestRecordTime: Date) -> Date? {
        let threshold: Double = 75.0
        let reductionPerMinute: Double = 0.2301
        
        guard totalCaffeine > threshold else {
            return nil
        }
        
        let minutesUntilBelowThreshold = (totalCaffeine - threshold) / reductionPerMinute
        
        let targetDate = latestRecordTime.addingTimeInterval(minutesUntilBelowThreshold * 60)
        
        return targetDate
    }
}
