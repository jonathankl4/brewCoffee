//
//  consumptionLogPage.swift
//  brewCoffee
//
//  Created by MacBook Air on 16/09/24.
//

import SwiftUI

struct consumptionLogPage: View {
    
    @State private var date = Date()
    var body: some View {
        
        VStack {
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 370,height: 330)
                    .foregroundStyle(.white)
                    .shadow(radius: 1)
                
                
                DatePicker(
                    "Start Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
               
                .datePickerStyle(.graphical)
                .accentColor(.warnacoklat)
                                
            }
            
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 370,height: 400)
                    .foregroundStyle(.white)
                    .shadow(radius: 1)
                VStack{
                    Spacer()
                    summary(tgl: "Monday, 10 September", desc: "you drank.....")
                    
                   
                    List {
                                Section(header: Text("History List")
                                    .font(.system(size: 20))
                                    .textCase(nil)
                                    .bold()
                                    .foregroundColor(Color.black)
                                    .padding(.leading, -20.0)) {
                                        
                                    // Header row
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
                                    
                                    // Data rows
                                    historyList(time: "09.15", caffeine: "66mg", name: "Latte")
                                    historyList(time: "10.30", caffeine: "80mg", name: "Extra Long Drink Name")
                                    historyList(time: "11.45", caffeine: "75mg", name: "Cappuccino")
                                }
                            }
                            .cornerRadius(10)

                }
            }
            .padding(3)
            
                            
 
            
        }
        .padding(20)
        
    }
}

struct summary: View {
    
    let tgl : String
    let desc :String
    var body: some View {
        
        
            
            
            VStack(alignment: .leading){
                Text(tgl).bold().font(.system(size: 18))
                Text(desc)
            }
            .padding(.leading, -160.0)
        
        
        
    }
}



#Preview {
    consumptionLogPage()
}
