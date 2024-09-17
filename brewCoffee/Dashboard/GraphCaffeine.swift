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
        ("08.00", 200),
        ("09.00", 150),
        ("10.00", 300),
        ("11.00", 250),
        ("12.00", 350),
        ("13.00", 400)
    ]
    var body: some View {
        Chart {
            ForEach(data, id: \.0) { month, sales in
                LineMark(
                    x: .value("Month", month),
                    y: .value("Sales", sales)
                )
                .foregroundStyle(.blue) // Warna garis
                .symbol(Circle()) // Simbol di titik data
            }
        }
        .frame(height: 300) // Ukuran chart
        .padding()
        .chartYScale(domain: 0...500) // Menentukan rentang sumbu Y
        .chartYAxis {
            AxisMarks(position: .leading, values: .stride(by: 50)) // Menampilkan angka di sisi kiri sumbu Y
        }
    }
}

#Preview {
    GraphCaffeine()
}
