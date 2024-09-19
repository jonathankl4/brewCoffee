//
//  SummaryCard.swift
//  brewCoffee
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI

struct SummaryCard: View {
    let img: String
    let jml: String
    let ket: String
    var body: some View {
        VStack (spacing: 10){
            Image(systemName: img)
            Text(jml)
                .font(.system(size: 10))
            Text(ket)
                .font(.system(size: 9))
        }
        .frame(width: 80, height: 80)
        .background(Color.cokelatMuda)
        .cornerRadius(15)
    }
}

#Preview {
    SummaryCard(img: "cup.and.saucer.fill", jml: "100", ket: "Caffeine (mg)")
}
