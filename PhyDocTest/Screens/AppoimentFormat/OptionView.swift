//
//  OptionView.swift
//  PhyDocTest
//
//  Created by Yerkebulan on 10.12.2024.
//
import SwiftUI

struct OptionView: View {
    let title: String
    let bodyMessage: String
    @Binding var selectedOption: AppointmentFormat
    let format: AppointmentFormat
    
    
    
    var isSelected: Bool {
        format == selectedOption
    }
    
    var body: some View {
        Button {
            selectedOption = format
        } label: {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.custom("Onest", size: 20))
                Text(bodyMessage)
                    .font(.custom("Onest-Regular", size: 16))
                    .foregroundStyle(.secondary)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
            
        }
        .buttonStyle(PlainButtonStyle())
        .frame(maxWidth: .infinity)
        .background(isSelected ? Color.backGroundBlue : Color.backGray)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(isSelected ? Color.mainBlue : Color.clear, lineWidth: 2)
        )
        .padding(.horizontal, 20)
        
    }
}
