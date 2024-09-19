//
//  CoffeeDetailSectionView.swift
//  brewCoffee
//
//  Created by MacBook Air on 19/09/24.
//

import SwiftUI

struct CoffeeDetailSectionView: View {
    @Binding var name: String
    @Binding var brand: String
    @Binding var selectedSizeCoffee: String

    var sizeCoffee: [String] {
        ["¼x", "½x", "¾x", "1x", "1½x", "2x"]
    }

    var body: some View {
        Section(header: Text("My Coffee").padding(.leading, -12.5).bold()) {
            HStack {
                Text("Name")
                Spacer()
                TextField("Add Name", text: $name)
                    .multilineTextAlignment(.trailing)
            }

            HStack {
                Text("Brand")
                Spacer()
                TextField("Add Brand", text: $brand)
                    .multilineTextAlignment(.trailing)
            }

            HStack {
                Picker("Size", selection: $selectedSizeCoffee) {
                    ForEach(sizeCoffee, id: \.self) { size in
                        Text(size)
                    }
                }
            }
        }
    }
}
