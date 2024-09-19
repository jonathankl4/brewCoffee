//
//  CoffeeView.swift
//  brewCoffee
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI
import SwiftData

struct CoffeeView: View {
    var coffeeList: [CoffeeBeans] = CoffeeBeans.dummies
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            List(filteredCoffeeList) { coffee in
                NavigationLink {
                    DetailCoffee()
                } label: {
                    CoffeeCard(img: coffee.imgCoffee, name: coffee.nameCoffee)
                }
                .listRowSeparator(.hidden)
            }
            .scrollContentBackground(.hidden)
            .searchable(text: $searchText, prompt: "Search Coffee")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Coffee")
                        .font(.system(size: 25))
                        .bold()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .accentColor(Color.warnacoklat)
    }
    
    var filteredCoffeeList: [CoffeeBeans] {
        if searchText.isEmpty {
            return coffeeList
        } else {
            return coffeeList.filter { coffee in
                coffee.nameCoffee.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

#Preview {
    CoffeeView()
}
