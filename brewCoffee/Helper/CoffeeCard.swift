//
//  CoffeeCard.swift
//  brewCoffee
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI

struct CoffeeCard: View {
    let icon: String
    let name: String
    var body: some View {
        HStack {
            Image(icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            Text(name)
                .font(.system(size: 22))
                .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
        }
        .padding()
        .background(Color.cokelatMuda)
        .cornerRadius(15)
    }
}

#Preview {
    CoffeeCard(icon: "arabica", name: "Arabica")
}
