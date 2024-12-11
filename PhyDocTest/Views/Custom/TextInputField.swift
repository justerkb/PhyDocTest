//
//  s.swift
//  PhyDocTest
//
//  Created by Yerkebulan on 10.12.2024.
//
import SwiftUI

struct TextInputField: View {
    
    let headerText: String
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(headerText)
                .font(.custom("Onest-Regular", size: 16))
            
            TextField(placeholder, text: $text)
                .padding()
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.mainGray, lineWidth: 2)
                )
        }
    }
}
