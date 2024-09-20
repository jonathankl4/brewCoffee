//
//  GraphCaffeine.swift
//  brewCoffee
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI
import Charts

struct GraphCaffeine: View {
    // Fungsi untuk menghitung jumlah kafein yang berkurang tiap jam
    func generateCaffeineData(startingCaffeine: Double, reduction: Double, startTime: Int) -> [(String, Double)] {
        var data: [(String, Double)] = []
        var caffeine = startingCaffeine
        var hour = startTime

        while caffeine > 0 {
            data.append(("\(String(format: "%02d:00", hour))", caffeine))
            caffeine -= reduction
            hour += 1
        }
        
        // Menambahkan nilai akhir saat kafein mencapai 0
        if caffeine <= 0 {
            data.append(("\(String(format: "%02d:00", hour))", 0))
        }

        return data
    }
    
    // Data yang dihasilkan dari fungsi
    let startingCaffeine: Double = 200
    let caffeineReduction: Double = 100
    let startTime: Int = 9 // Waktu mulai dinamis, misalnya mulai dari jam 9 pagi

    var body: some View {
        let caffeineData = generateCaffeineData(startingCaffeine: startingCaffeine, reduction: caffeineReduction, startTime: startTime)
        
        Chart {
            ForEach(caffeineData, id: \.0) { time, caffeine in
                BarMark(
                    x: .value("Time", time),
                    y: .value("Caffeine", caffeine)
                )
                .foregroundStyle(Color.warnacoklat)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            }
        }
        .chartScrollableAxes(.horizontal)
        .chartXVisibleDomain(length: 4)
        .frame(height: 300)
        .padding()
        .chartYScale(domain: 0...startingCaffeine)
        .chartYAxis {
            AxisMarks(position: .leading, values: .stride(by: 50))
        }
    }
}

#Preview {
    GraphCaffeine()
}

