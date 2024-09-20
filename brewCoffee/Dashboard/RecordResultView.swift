//
//  RecordResultView.swift
//  brewCoffee
//
//  Created by MacBook Air on 20/09/24.
//

import SwiftUI

struct RecordResultView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Body Caffeine").padding(.leading, -12.5).bold().foregroundColor(Color.warnacoklat)) {
                    HStack {
                        Text("The amount of caffeine present in your body after consumption.")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("66 mg")
                    }
                }
                
                Section(header: Text("Caffeine Limit").padding(.leading, -12.5).bold().foregroundColor(Color.warnacoklat)) {
                    HStack {
                        Text("The amount of caffeine still in the body after initial consumption that is considered safe.")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("66/200 mg")
                    }
                }
                
                Section(header: Text("Details").padding(.leading, -12.5).bold().foregroundColor(Color.warnacoklat)) {
                    HStack {
                        Text("Name")
                          Spacer()
                            
                        Text("Americano")
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Brand")
                          Spacer()
                            
                        Text("Indomie")
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Size")
                          Spacer()
                            
                        Text("1 cup")
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Time")
                          Spacer()
                            
                        Text("Friday, sdkakjd")
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Gram")
                          Spacer()
                            
                        Text("100 kg")
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Water")
                          Spacer()
                            
                        Text("200 ml")
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
    RecordResultView()
}
