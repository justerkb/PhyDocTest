//
//  ClientInfoCell.swift
//  PhyDocTest
//
//  Created by Yerkebulan on 10.12.2024.
//
import SwiftUI
struct clientInfo: Identifiable {
    let id = UUID()
    let type: String
    let value: String
}

struct ClientInfoCell: View {
    
    
    let info: clientInfo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(info.type + ":")
                .font(.custom("Onest-Regular", size: 16))
                .foregroundStyle(Color.textGray)
            Text(info.value)
                .font(.custom("Onest-Medium", size: 18))
                .foregroundStyle(Color.mainBlack)
        }
        .frame(maxWidth:.infinity, alignment: .leading)
        
    }
    
}
