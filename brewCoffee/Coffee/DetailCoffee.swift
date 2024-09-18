//
//  DetailCoffee.swift
//  brewCoffee
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI

struct DetailCoffee: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 10) {

                    Image("chicory")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(10)
                    
                    Text("Chicory Coffee: A Healthy Coffee")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Text("Chicory coffee is made from the roasted roots of the chicory plant, which are ground and brewed like regular coffee. It has a rich, slightly nutty flavor, often resembling coffee but with a distinct earthiness.")
                        .font(.body)
                    
                    Text("This coffee alternative is caffeine-free, making it a popular choice for those looking to cut down on their caffeine intake. Chicory is also known for its potential health benefits, as it contains inulin, a type of prebiotic fiber that supports digestive health. Additionally, it may help improve blood sugar control and reduce inflammation.")
                        .font(.body)
                    
                    Text("Many people mix chicory with regular coffee to enjoy a balanced flavor while reducing caffeine. Chicory coffee is commonly used in New Orleans-style coffee blends, offering a unique twist to traditional coffee drinking.")
                        .font(.body)
                }
                .padding()
            }
            .navigationTitle("Detail Coffee")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    DetailCoffee()
}
