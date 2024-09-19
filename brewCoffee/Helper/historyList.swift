//
//  historyList.swift
//  brewCoffee
//
//  Created by MacBook Air on 16/09/24.
//

import SwiftUI

struct historyList: View {
    
    let time: String
    let caffeine: String
    let name: String
    
    var body: some View {
        HStack {
            Text(time)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(caffeine)
                .frame(maxWidth: .infinity, alignment: .center)
            Text(name)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    historyList(time: "09.15", caffeine: "66 mg", name: "Latte")
}
