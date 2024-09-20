//
//  RecordResultView.swift
//  brewCoffee
//
//  Created by MacBook Air on 20/09/24.
//

import SwiftUI

struct RecordResultView: View {
    var name: String
    var size: String
    var time: String
    var coffeeAmount: String
    var waterAmount: String
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Body Caffeine").padding(.leading, -12.5).bold().foregroundColor(Color.warnacoklat)) {
                    HStack {
                        Text("The amount of caffeine present in your body after consumption.")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("66 mg") //kafein disini
                    }
                }
                
                Section(header: Text("Caffeine Limit").padding(.leading, -12.5).bold().foregroundColor(Color.warnacoklat)) {
                    HStack {
                        Text("The amount of caffeine still in the body after initial consumption that is considered safe.")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("66/200 mg") //kafein disini
                    }
                }
                
                Section(header: Text("Details").padding(.leading, -12.5).bold().foregroundColor(Color.warnacoklat)) {
                    HStack {
                        Text("Name")
                          Spacer()
                            
                        Text(name)//dari halaman sebelumnya
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Size")
                          Spacer()
                            
                        Text(size)//dari halaman sebelumnya
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Time")
                          Spacer()
                        Text(time)//dari halaman sebelumnya
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Coffee")
                          Spacer()
                            
                        Text(coffeeAmount)//dari halaman sebelumnya
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Water")
                          Spacer()
                            
                        Text(waterAmount)//dari halaman sebelumnya
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
            .navigationTitle("Caffeine Record")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RecordResultView(name: "Americano", size: "1 Cup", time: "Jumat, sdsdkjd", coffeeAmount: "100 mg", waterAmount: "1000 ml")
}
