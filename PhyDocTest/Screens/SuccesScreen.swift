//
//  Succes.swift
//  PhyDocTest
//
//  Created by Yerkebulan on 11.12.2024.
//

import SwiftUI

struct SuccesScreen: View {
    var body: some View {
        ZStack {
            Color.mainBlue
            
            
            VStack(alignment: .leading, spacing: 12) {
                
                Spacer()
                Text("Вы записаны на прием!")
                    .font(.custom("Onest-Medium", size: 36))
                    .foregroundStyle(Color.white)
                Text("""
Мы отправим вам уведмление чтобы вы не забыли о приеме. 
Если захотите изменить или отменить запись, вы можете сделать на странице с записями.                     
""")
                .font(.custom("Onest-Regular", size: 16))
                .foregroundStyle(Color.white)
                
                
                Spacer()

                Button {
                    print("ok pressed")
                } label: {
                    Text("Хорошо")
                        .font(.custom("Onest-Bold", size: 16))
                        .foregroundStyle(Color.mainBlack)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(28)
                }
                .padding(.bottom, 20)
                
                

            }
            .padding(.horizontal, 20)
            
            
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SuccesScreen()
}
