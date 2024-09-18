//
//  HistoryLogView.swift
//  brewCoffee
//
//  Created by MacBook Air on 18/09/24.
//

import SwiftUI

struct HistoryLogView: View {
    @State private var date = Date()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.white)
                        .shadow(radius: 2)
                        .frame(width: 370, height: 330)
                    
                    DatePicker(
                        "Start Date",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
                    .accentColor(.warnacoklat)
                    .padding(30)
                }
            
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.white)
                        .shadow(radius: 3)
                        .frame(width: 370, height: 270)
                    VStack {
                        SummaryLog(tgl: "Monday, 10 September", desc: "you drank.....")
                        Divider()
                        HStack {
                            Text("Time")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .bold()
                            Text("Caffeine")
                                .frame(maxWidth: .infinity, alignment: .center)
                                .bold()
                            Text("Name")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .bold()
                        }
                        Divider()
                        List {
                            historyList(time: "09.15", caffeine: "66mg", name: "Latte")
                            historyList(time: "10.30", caffeine: "80mg", name: "Extra Long Drink Name")
                            historyList(time: "11.45", caffeine: "75mg", name: "Cappuccino")
                        }
                        .frame(height: 120)
                        .scrollContentBackground(.hidden)
                        .listStyle(.plain)
                    }
                    .cornerRadius(10)
                    .padding(.top, -10)
                    .padding(30)
                }
                .padding(.top, -10)
            }
            .padding(.top, -50)
            .navigationTitle("Consumption Log")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Close") {
                            dismiss()
                    }
                    .foregroundColor(Color.warnacoklat)
                }
            }
        }
    }
}

struct SummaryLog: View {
    let tgl : String
    let desc :String
    var body: some View {
        VStack(alignment: .leading){
            Text(tgl).bold().font(.system(size: 18))
            Text(desc)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    HistoryLogView()
}
