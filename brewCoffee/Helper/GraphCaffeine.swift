//
//  GraphCaffeine.swift
//  brewCoffee
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI
import Charts

struct GraphCaffeine: View {
    let data: [(String, Double)] = [
        ("08.00", 100),
        ("09.00", 150),
        ("10.00", 300),
        ("11.00", 250),
        ("12.00", 350),
        ("13.00", 400)
    ]
    var body: some View {
        Chart {
            ForEach(data, id: \.0) { month, sales in
                BarMark(
                    x: .value("Month", month),
                    y: .value("Sales", sales)
                )
                .foregroundStyle(Color.warnacoklat)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .symbol(Circle())
            }
        }
        .chartScrollableAxes(.horizontal)
        .chartXVisibleDomain(length: 4)
        .frame(height: 300)
        .padding()
        .chartYScale(domain: 0...500)
        .chartYAxis {
            AxisMarks(position: .leading, values: .stride(by: 50))
        }
    }
}

#Preview {
    GraphCaffeine()
}
