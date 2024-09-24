//
//  historyList.swift
//  brewCoffee
//
//  Created by MacBook Air on 16/09/24.
//

import SwiftUI

struct historyList: View {
    
    var coffeeRecord: RecordsCoffee
    
    var body: some View {
        HStack {
            Text(formattedTime(from: coffeeRecord.time))
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("\(Int(coffeeRecord.caffeineCoffee))")
                .frame(maxWidth: .infinity, alignment: .center)
            Text(coffeeRecord.name)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.vertical, 5)
    }
    
    func formattedTime(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

//#Preview {
//    historyList(time: "09.15", caffeine: "66 mg", name: "Latte")
//}
