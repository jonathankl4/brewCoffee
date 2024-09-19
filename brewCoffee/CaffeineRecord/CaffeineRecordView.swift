//
//  ContentView.swift
//  brewCoffee
//
//  Created by MacBook Air on 19/09/24.
//

import SwiftUI

struct CaffeineRecordView: View {
    @StateObject private var coffeeController = CoffeeController()
    
    @State private var showModal = false
    @State private var coffeeName = ""
    @State private var coffeeBrand = ""
    @State private var coffeeSize = 1
    @State private var coffeeDate = ""
    @State private var coffeeTime = ""
    @State private var coffeeCoffeeGram = 0
    @State private var coffeeWater = 0
    
    var body: some View {
        TabView {
            NavigationStack {
                VStack {
                    Button(action: {
                        showModal.toggle()
                    }) {
                        Text("Add Coffee")
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .navigationTitle("Add Data")
                .sheet(isPresented: $showModal) {
                    CoffeeFormView(
                        name: $coffeeName,
                        brand: $coffeeBrand,
                        size: $coffeeSize,
                        date: $coffeeDate,
                        time: $coffeeTime,
                        coffeeGram: $coffeeCoffeeGram,
                        water: $coffeeWater,
                        
                        onCancel: {
                            showModal = false
                        },
                        onSave: {
                            coffeeController.addCoffee(
                                name: coffeeName,
                                brand: coffeeBrand,
                                size: coffeeSize,
                                date: coffeeDate,
                                time: coffeeTime,
                                coffeeGram: coffeeCoffeeGram,
                                water: coffeeWater
                            )
                            showModal = false
                        }
                    )
                }
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }

            NavigationStack {
                List {
                    ForEach(coffeeController.savedCoffees, id: \.self) { coffee in
                        Button(action: {
                            coffeeController.selectedCoffee = coffee
                        }) {
                            CoffeeRowView(coffee: coffee)
                        }
                    }
                }
                .navigationTitle("Saved Coffees")
                .onAppear {
                    coffeeController.loadCoffeeData()
                }
                .sheet(item: $coffeeController.selectedCoffee) { coffee in
                    CoffeeDetailSheetView(coffee: coffee)
                }
            }
            .tabItem {
                Label("History", systemImage: "pencil.and.list.clipboard")
            }

            NavigationStack {
                Text("About")
                    .navigationTitle("About")
            }
            .tabItem {
                Label("About", systemImage: "info.circle")
            }
        }
    }
}

#Preview {
    CaffeineRecordView()
}

