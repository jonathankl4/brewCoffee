//
//  AddRecordView.swift
//  brewCoffee
//
//  Created by MacBook Air on 19/09/24.
//

import SwiftUI

struct AddRecordView: View {
    @Environment(\.dismiss) var dismiss
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
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.warnacoklat)
                }
                
                ToolbarItem(placement: .principal) {
                    Text("Add Record")
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
    AddRecordView()
}
