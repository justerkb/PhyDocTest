//
//  ErrorView.swift
//  PhyDocTest
//
//  Created by Yerkebulan on 11.12.2024.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundStyle(Color.mainOrange)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Отмена и изменение времени приема может стоит денег.")
                    .font(.custom("Onest-Regular", size: 18))
                    .foregroundStyle(Color.mainBrown)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button {
                    print("поробнее tupped")
                } label: {
                    Text("Подробнее")
                        .font(.custom("One-Medium", size: 16))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.white)
                        .cornerRadius(16)
                }
                .buttonStyle(PlainButtonStyle())

            }
        }
        .padding(16)
        .background(Color.secondaryOrange)
        .cornerRadius(12)
    }
    
}
