//
//  CaffeineManager.swift
//  brewCoffee
//
//  Created by MacBook Air on 25/09/24.
//

import SwiftUI

class CaffeineManager: ObservableObject {
    @Published var currentCaffeine: Double = 0.0 // Kafein yang diperbarui
    private var timer: Timer?
    
    init() {
        startCaffeineReductionTimer()
    }
    
    // Fungsi untuk memulai pengurangan kafein secara real-time
    func startCaffeineReductionTimer() {
        // Mulai timer untuk mengurangi kafein setiap menit
        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
            self.updateCaffeine()
        }
    }
    
    // Fungsi untuk menghentikan timer
    func stopCaffeineReductionTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    // Mengupdate nilai kafein secara real-time
    func updateCaffeine() {
        let reductionPerMinute = 0.2301 // Pengurangan per menit
        if currentCaffeine > 0 {
            currentCaffeine = max(currentCaffeine - reductionPerMinute, 0) // Jangan kurang dari 0
        }
    }
    
    // Reset nilai kafein ketika record di-update
    func resetCaffeineValue(for records: [RecordsCoffee]) {
        let totalCaffeineWithoutReduction = records.reduce(0) { total, record in
            total + record.caffeineCoffee
        }
        currentCaffeine = totalCaffeineWithoutReduction - calculateCaffeineReduction(for: records)
    }
    
    // Fungsi untuk menghitung pengurangan kafein berdasarkan waktu
    func calculateCaffeineReduction(for records: [RecordsCoffee]) -> Double {
        var totalReduction: Double = 0.0
        let caffeineDecayRate: Double = 0.2301 // mg per minute
        
        for record in records {
            let elapsedMinutes = Date().timeIntervalSince(record.time) / 60 // Waktu berlalu dalam menit
            let reductionForRecord = caffeineDecayRate * elapsedMinutes
            totalReduction += min(record.caffeineCoffee, reductionForRecord) // Tidak melebihi kafein awal
        }
        
        return totalReduction
    }
    
    // Fungsi untuk menghitung waktu sampai kafein berada di bawah 75 mg
    func timeUntilCaffeineBelowThreshold(totalCaffeine: Double, latestRecordTime: Date) -> Date? {
        let threshold: Double = 75.0
        let reductionPerMinute: Double = 0.2301
        
        // Pastikan total kafein lebih dari threshold
        guard totalCaffeine > threshold else {
            return nil // Kafein sudah di bawah threshold
        }
        
        // Hitung berapa menit lagi sampai kafein di bawah 75 mg
        let minutesUntilBelowThreshold = (totalCaffeine - threshold) / reductionPerMinute
        
        // Hitung waktu target dari waktu catatan terbaru
        let targetDate = latestRecordTime.addingTimeInterval(minutesUntilBelowThreshold * 60) // Konversi menit ke detik
        
        return targetDate
    }
}
