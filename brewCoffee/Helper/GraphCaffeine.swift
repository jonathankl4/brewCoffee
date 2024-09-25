//
//  GraphCaffeine.swift
//  brewCoffee
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI
import Charts

struct GraphCaffeine: View {
    
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
    
    let startingCaffeine: Double = 200
    let caffeineReduction: Double = 10
    let startTime: Int = 9
    let threshold: Double = 100

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
            
            RuleMark(
                y: .value("Threshold", threshold)
            )
            .lineStyle(StrokeStyle(lineWidth: 1, dash: [5, 5]))
            .foregroundStyle(Color.secondary)
            .annotation(position: .topTrailing) {
                Text("Threshold \(Int(threshold)) mg")
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(5)
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(5)
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

