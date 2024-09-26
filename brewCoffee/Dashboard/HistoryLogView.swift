//
//  HistoryLogView.swift
//  brewCoffee
//
//  Created by MacBook Air on 18/09/24.
//

import SwiftUI
import SwiftData

struct HistoryLogView: View {
    @Query var coffeeRecord: [RecordsCoffee]
    @State private var date = Date()
    @State private var selectedRecord: RecordsCoffee?
    @State private var recordToDelete: RecordsCoffee?
    @State private var showEditRecord = false
    @State private var showDeleteConfirmation = false
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    
    var body: some View {
        let filteredRecords = coffeeRecord.filter { record in
            Calendar.current.isDate(record.date, inSameDayAs: date)
        }
        
        let totalCaffeineToday = filteredRecords.reduce(0) { total, record in
            total + record.caffeineCoffee
        }
        NavigationStack {
            VStack {
                VStack {
                    DatePicker(
                        "Start Date",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
                    .accentColor(.warnacoklat)
                }
                .padding(20)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: 330)
                .background(.white)
                .cornerRadius(10)
                .shadow(radius: 2)
                .padding(.bottom, 20)
                
                VStack {
                    SummaryLog(tgl: formattedDate(date), desc: "You drank \(Int(totalCaffeineToday)) mg of caffeine on that today")
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
                    if filteredRecords.isEmpty {
                        Text("No records found for this date.")
                            .foregroundColor(.gray)
                    } else {
                        List(filteredRecords) { record in
                            historyList(coffeeRecord: record)
                                .swipeActions {
                                    Button(action: {
                                        selectedRecord = record
                                        showEditRecord = true
                                    }) {
                                        Label("Edit", systemImage: "pencil")
                                    }
                                    .tint(.blue)

                                    Button(action: {
                                        recordToDelete = record
                                        showDeleteConfirmation = true
                                    }) {
                                        Label("Delete", systemImage: "trash")
                                    }
                                    .tint(.red)
                                }
                        }
                        .frame(height: 120)
                        .scrollContentBackground(.hidden)
                        .listStyle(.plain)
                    }
                    Spacer()
                }
                .padding(25)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: 300)
                .background(.white)
                .cornerRadius(10)
                .shadow(radius: 2)
            }
            .padding(.top, -10)
            .padding()
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
            .sheet(item: $selectedRecord) { record in
                let bindingRecord = Binding(
                    get: { record },
                    set: { selectedRecord = $0 }
                )
                EditRecord(coffeeRecord: bindingRecord)
                    .onAppear {
                        print("EditRecord appeared with record: \(record)")
                    }
            }
            .alert(isPresented: $showDeleteConfirmation) {
                Alert(
                    title: Text("Delete Record"),
                    message: Text("Are you sure you want to delete this record?"),
                    primaryButton: .destructive(Text("Delete")) {
                        if let recordToDelete = recordToDelete {
                            deleteRecord(recordToDelete) // Hapus rekaman
                        }
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
    
    func deleteRecord(_ record: RecordsCoffee) {
        context.delete(record)
        do {
            try context.save()
        } catch {
            print("Failed to delete record: \(error)")
        }
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: date)
    }
}

struct SummaryLog: View {
    let tgl : String
    let desc :String
    var body: some View {
        VStack(alignment: .leading){
            Text(tgl).bold().font(.system(size: 18))
            Text(desc)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}



#Preview {
    HistoryLogView()
}
