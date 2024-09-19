//
//  CurrentCoffeeCard.swift
//  brewCoffee
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI

struct CurrentCoffeeCard: View {
    let name: String
    let time: String   
    let jml: String
    var body: some View {
        HStack {
            Image(systemName: "wineglass.fill")
                .font(.system(size: 25))
            VStack {
                Text(name)
                HStack {
                    Image(systemName: "clock")
                    Text(time)
                }
            }
            Spacer()
            HStack {
                Image(systemName: "globe")
                Text(jml)
            }
        }
        .padding()
        .frame(height: 80)
        .background(Color.cokelatMuda)
        .cornerRadius(15)
    }
}

#Preview {
    CurrentCoffeeCard(name: "Mocha Latte", time: "11.47", jml: "68 mg")
}
