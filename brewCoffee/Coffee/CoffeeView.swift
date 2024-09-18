//
//  CoffeeView.swift
//  brewCoffee
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI

struct CoffeeView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    DetailCoffee()
                } label: {
                    CoffeeCard(img: "arabica", name: "Arabica")
                }
                .listRowSeparator(.hidden)
                
                NavigationLink {
                    DetailCoffee()
                } label: {
                    CoffeeCard(img: "arabica", name: "Arabica")
                }
                .listRowSeparator(.hidden)
                
                NavigationLink {
                    DetailCoffee()
                } label: {
                    CoffeeCard(img: "arabica", name: "Arabica")
                }
                .listRowSeparator(.hidden)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Coffee")
                        .font(.system(size: 25))
                        .bold()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CoffeeView()
}
