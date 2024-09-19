//
//  Coffee.swift
//  brewCoffee
//
//  Created by MacBook Air on 19/09/24.
//

import Foundation

struct CoffeeBeans: Identifiable {
    var id: UUID = UUID()
    var nameCoffee: String
    var imgCoffee: String
    var titleArticle: String
    var article: String
}

extension CoffeeBeans {
    static var dummies: [CoffeeBeans] = [
        CoffeeBeans(nameCoffee: "Arabica", imgCoffee: "arabica", titleArticle: "Arabica nih bos", article: "Eeheehee"),
        CoffeeBeans(nameCoffee: "Chicory", imgCoffee: "chicorykopi", titleArticle: "Arabica nih bos", article: "Eeheehee"),
        CoffeeBeans(nameCoffee: "Kapal Api", imgCoffee: "kapal_api", titleArticle: "Arabica nih bos", article: "Eeheehee")
    ]
}
