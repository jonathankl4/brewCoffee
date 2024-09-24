//
//  CurrentCoffeeCard.swift
//  brewCoffee
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI

struct CurrentCoffeeCard: View {
    var coffeeRecord: RecordsCoffee
    var body: some View {
        HStack {
            Image(coffeeRecord.iconCoffee)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(coffeeRecord.name)
                HStack {
                    Image(systemName: "clock")
                    Text(formattedTime(from: coffeeRecord.time))
                }
            }
            Spacer()
            HStack {
                Image("coffee_dashboard")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                Text("\(Int(coffeeRecord.caffeineCoffee)) mg")
            }
        }
        .padding()
        .frame(height: 80)
        .background(Color.cokelatMuda)
        .cornerRadius(15)
    }
    
    func formattedTime(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

//#Preview {
//    CurrentCoffeeCard(coffeeRecord: CoffeeRecord)
//}
