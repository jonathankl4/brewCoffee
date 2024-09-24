//
//  DetailCoffee.swift
//  brewCoffee
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI

struct DetailCoffee: View {
    var titleArticle: String
    var imgArticle: String
    var article: String
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 10) {

                    Image(imgArticle)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(10)
                    
                    Text(titleArticle)
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Text(article)
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .center)

                }
                .padding()
            }
            .navigationTitle("Detail Coffee")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

//#Preview {
//    DetailCoffee(titleArticle: "Chicory Coffee: A Healthy Coffee", imgArticle: "chicory")
//}
