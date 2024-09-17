//
//  ContentView.swift
//  brewCoffee
//
//  Created by MacBook Air on 15/09/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    var body: some View {
        TabView {
            DashboardView()
            .tabItem {
                Image(systemName: "house")
                Text("Dashboard")
            }
            
            
            CoffeeView()
            .tabItem {
                Image(systemName: "cup.and.saucer.fill")
                Text("Coffee")
            }
        }
    }
}

#Preview {
    ContentView()
}
