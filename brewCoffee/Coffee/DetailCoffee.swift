//
//  DetailCoffee.swift
//  brewCoffee
//
//  Created by MacBook Air on 17/09/24.
//

import SwiftUI
import UIKit

struct JustifiedTextView: UIViewRepresentable {
    var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.isSelectable = false
        textView.textAlignment = .justified
        textView.text = text
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.textColor = .black
        textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        textView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

struct DetailCoffee: View {
    var titleArticle: String
    var imgArticle: String
    var article: String
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Image(imgArticle)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: geometry.size.height * 0.3)
                            .cornerRadius(10)
                        
                        Text(titleArticle)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        JustifiedTextView(text: article)
                            .frame(minHeight: geometry.size.height * 0.5)
                            .background(Color.white)
                    }
                    .padding()
                }
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
