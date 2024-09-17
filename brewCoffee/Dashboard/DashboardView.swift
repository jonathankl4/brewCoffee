//
//  DashboardView.swift
//  brewCoffee
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        SummaryCard(img: "cup.and.saucer.fill", jml: "100", ket: "Caffeine (mg)")
                        SummaryCard(img: "cup.and.saucer.fill", jml: "100", ket: "Caffeine (mg)")
                        SummaryCard(img: "cup.and.saucer.fill", jml: "100", ket: "Caffeine (mg)")
                        SummaryCard(img: "cup.and.saucer.fill", jml: "100", ket: "Caffeine (mg)")
                    }
                    .padding(.bottom, 20)
                    
                    
                    Text("Caffeine Today")
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                    
                    VStack {
                        GraphCaffeine()
                    }
                    .padding(.bottom, 20)
                    
                    HStack {
                        Text("Current Coffee")
                            .font(.title2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .bold()
                        
                        Button(action: {
                            print("Button pressed")
                        }) {
                            HStack {
                                Image(systemName: "plus")
                                Text("Add Record")
                            }
                            .font(.system(size: 14))
                            .bold()
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(Color.warnacoklat)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                        }
                    }
                    
                    VStack {
                        CurrentCoffeeCard(name: "Mocha Latte", time: "11.47 a.m", jml: "68 mg")
                        
                    }
                    Text("Log Detail")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .foregroundColor(.brown)
                }
                .padding()
                .navigationTitle("Dashboard")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // Aksi ketika tombol lonceng ditekan
                            print("Bell icon tapped")
                        }) {
                            Image(systemName: "bell.fill")
                                .font(.title2) // Ukuran icon
                                .foregroundColor(Color.warnacoklat)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    DashboardView()
}
