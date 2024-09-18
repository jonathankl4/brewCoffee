//
//  ContentView.swift
//  brewCoffee
//
//  Created by MacBook Air on 15/09/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "hijau")
        UITabBar.appearance().barTintColor = UIColor.cokelatMuda
        UITabBar.appearance().backgroundColor = UIColor(named: "cokelatMuda")
    }
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
        .accentColor(Color.warnacoklat)
    }
}

#Preview {
    ContentView()
}
