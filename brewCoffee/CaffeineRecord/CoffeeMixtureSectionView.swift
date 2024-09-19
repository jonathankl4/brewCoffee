//
//  CoffeeMixtureSectionView.swift
//  brewCoffee
//
//  Created by MacBook Air on 19/09/24.
//

import SwiftUI

struct CoffeeMixtureSectionView: View {
    @Binding var selectedSizeCoffee: String
    @Binding var coffeeGram: Int
    @Binding var water: Int
    
    let coffeeBase: Double = 13.0
    let waterBase: Double = 208.0
    
    var coffeeAmount: Double {
        switch selectedSizeCoffee {
        case "¼x": return coffeeBase * 0.25
        case "½x": return coffeeBase * 0.5
        case "¾x": return coffeeBase * 0.75
        case "1x": return coffeeBase
        case "1½x": return coffeeBase * 1.5
        case "2x": return coffeeBase * 2.0
        default: return coffeeBase
        }
    }
    
    var waterAmount: Double {
        switch selectedSizeCoffee {
        case "¼x": return waterBase * 0.25
        case "½x": return waterBase * 0.5
        case "¾x": return waterBase * 0.75
        case "1x": return waterBase
        case "1½x": return waterBase * 1.5
        case "2x": return waterBase * 2.0
        default: return waterBase
        }
    }
    
    var body: some View {
        Section(header: Text("Coffee Mixtures").padding(.leading, -12.5).bold()) {
            HStack {
                Text("Coffee (mg)")
                Spacer()
                Text("\(Int(coffeeAmount)) mg")
                    .onChange(of: selectedSizeCoffee) { newSize in
                        coffeeGram = (Int(coffeeAmount))
                    }
            }

            HStack {
                Text("Water (ml)")
                Spacer()
                Text("\(Int(waterAmount)) ml")
                    .onChange(of: selectedSizeCoffee) { newSize in
                        water = (Int(waterAmount))
                    }
            }
        }
        .onAppear {
            // Initialize values when the view appears
            coffeeGram = (Int(coffeeAmount))
            water = (Int(waterAmount))
        }
    }
}
