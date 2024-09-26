//
//  GraphCaffeine.swift
//  brewCoffee
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI
import SwiftData
import Charts

struct GraphCaffeine: View {
    @Query var coffeeRecord: [RecordsCoffee]
    
    @State private var selectedDataPoint: (date: Date, level: Double)? = nil
    
    var belowThresholdDate: Date? {
        let todayRecords = coffeeRecord.filter { record in
            Calendar.current.isDateInToday(record.date)
        }
        
        let totalCaffeineToday = todayRecords.reduce(0) { total, record in
            total + record.caffeineCoffee
        }
        
        // Jika tidak ada catatan kopi hari ini, langsung kembalikan nil
        if todayRecords.count == 0 {
            return nil
        }
        
        
        let (_, belowThresholdDate) = generateCaffeineData(initialCaffeine: totalCaffeineToday)
        return belowThresholdDate
    }
    
    var body: some View {
        let todayRecords = coffeeRecord.filter { record in
            Calendar.current.isDateInToday(record.date)
        }
        
        let totalCaffeineToday = todayRecords.reduce(0) { total, record in
            total + record.caffeineCoffee
        }
        
        let (caffeineData, _) = generateCaffeineData(initialCaffeine: totalCaffeineToday)
        
        Chart {
            ForEach(caffeineData, id: \.date) { dataPoint in
                BarMark(
                    x: .value("Time", dataPoint.date),
                    y: .value("Caffeine Level", dataPoint.level)
                )
                .foregroundStyle(Color.warnacoklat)
                .cornerRadius(4)
            }
            
            RuleMark(
                y: .value("Threshold", 75)
            )
            .lineStyle(StrokeStyle(lineWidth: 1, dash: [5, 5]))
            .foregroundStyle(.secondary)
            .annotation(position: .trailing, alignment: .trailing) {
                Text("75 mg")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.trailing, 4)
            }
        }
        .frame(height: 300)
        .chartScrollableAxes(.horizontal)
        .chartXScale(domain: caffeineData.first!.date...caffeineData.last!.date)
        .chartYAxis {
            AxisMarks(position: .leading) { value in
                AxisValueLabel {
                    if let caffeine = value.as(Double.self) {
                        Text("\(Int(caffeine)) mg")
                    }
                }
                AxisGridLine()
            }
        }
        .chartXAxis {
            AxisMarks(values: .stride(by: .hour, count: 3)) { value in
                if let date = value.as(Date.self) {
                    let hour = Calendar.current.component(.hour, from: date)
                    AxisValueLabel {
                        VStack(alignment: .leading) {
                            Text(formatHour(date))
                                .font(.caption)
                            if hour == 0 {
                                Text(date, format: .dateTime.month(.abbreviated).day())
                                    .font(.caption)
                            }
                        }
                    }
                    AxisGridLine()
                    AxisTick()
                }
            }
        }
        .chartXScale(domain: caffeineData.first!.date...caffeineData.last!.date)
        .chartYScale(domain: 0...max(totalCaffeineToday, 200))
    }
    
    func generateCaffeineData(initialCaffeine: Double) -> (data: [(date: Date, level: Double)], belowThresholdDate: Date?) {
        var dataArray: [(date: Date, level: Double)] = []
        let endDate = Date()
        let startDate = Calendar.current.date(byAdding: .day, value: -1, to: endDate)!
        var currentCaffeine = initialCaffeine
        var belowThresholdDate: Date? = nil
        
        for i in 0..<72 {
            let date = startDate.addingTimeInterval(Double(i) * 1200)
            currentCaffeine = max(0, currentCaffeine - 0.2301 * 20)
 
            if belowThresholdDate == nil && currentCaffeine < 75 {
                belowThresholdDate = date
            }
            
            dataArray.append((date: date, level: currentCaffeine))
        }
        
        return (data: dataArray, belowThresholdDate: belowThresholdDate)
    }

    
    private func formatHour(_ date: Date) -> String {
        let hour = Calendar.current.component(.hour, from: date)
        let hourString = String(format: "%02d", hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour))
        let ampm = hour >= 12 ? "pm" : "am"
        return "\(hourString)\(ampm)"
    }
}

//#Preview {
//    GraphCaffeine()
//}

