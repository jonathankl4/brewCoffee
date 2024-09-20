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
    var titleArticle: String
    var imgArticle: String
    var iconCoffee: String
    var article: String
}

extension CoffeeBeans {
    static var dummies: [CoffeeBeans] = [
        CoffeeBeans(nameCoffee: "Chicory", titleArticle: "Chicory Coffee: A Healthy Coffee", imgArticle: "chicory", iconCoffee: "chicorykopi", article: "halooo gayss"),
        CoffeeBeans(nameCoffee: "Luwak", titleArticle: "Luwak Coffee: A Healthy Coffee", imgArticle: "chicory", iconCoffee: "luwak", article: "halooo gayss"),
        CoffeeBeans(nameCoffee: "Arabica", titleArticle: "Arabica Coffee: A Healthy Coffee", imgArticle: "chicory", iconCoffee: "arabica", article: "halooo gayss"),
        CoffeeBeans(nameCoffee: "Java Coffee", titleArticle: "Java Coffee: A Healthy Coffee", imgArticle: "chicory", iconCoffee: "kapal_api", article: "halooo gayss"),
    ]
}
