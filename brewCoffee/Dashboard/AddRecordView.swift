//
//  AddRecordView.swift
//  brewCoffee
//
//  Created by MacBook Air on 19/09/24.
//

import SwiftUI

struct AddRecordView: View {
    @Environment(\.dismiss) var dismiss
    var coffeeList: [CoffeeDrinks] = CoffeeDrinks.dummies
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            List(filteredCoffeeList) { coffee in
                NavigationLink {
                    FormRecordView(coffeeName: coffee.nameCoffee, caffeineCoffee: coffee.caffeineCoffee, iconCoffee: coffee.iconCoffee)
                } label: {
                    CoffeeCard(icon: coffee.iconCoffee, name: coffee.nameCoffee)
                }
                .listRowSeparator(.hidden)
            }
            .scrollContentBackground(.hidden)
            .searchable(text: $searchText, prompt: "Search Coffee")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.warnacoklat)
                }
                
                ToolbarItem(placement: .principal) {
                    Text("Add Record")
                        .bold()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .accentColor(Color.warnacoklat)
    }
    
    var filteredCoffeeList: [CoffeeDrinks] {
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
    AddRecordView()
}
