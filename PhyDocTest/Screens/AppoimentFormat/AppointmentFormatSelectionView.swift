//
//  AppointmentFormatSelectionView.swift
//  PhyDocTest
//
//  Created by Yerkebulan on 10.12.2024.
//

import Foundation
import SwiftUI
enum AppointmentFormat {
    case online
    case clinic
    case home
}

struct AppointmentFormatSelectionView: View {
    @EnvironmentObject var appoimentVIewModel: AppoimentFormatViewModel
    
    var body: some View {
        VStack {
            Text("Выберите формат приема")
            
                .font(.custom("Onest", size: 32))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 0)
                .padding(.bottom, 32)
                .padding(.horizontal, 20)
            VStack(spacing: 16) {
                OptionView(title: "Онлайн-консультация",
                           bodyMessage: "Врач созвонится с вами и проведет консультацию в приложении.",
                           selectedOption: $appoimentVIewModel.selectedOption,
                           format: .online)
                OptionView(title: "Записаться в клинику",
                           bodyMessage: "Врач будет ждать вас в своем кабинете в клинике. ",
                           selectedOption: $appoimentVIewModel.selectedOption,
                           format: .clinic)
                OptionView(title: "Вызвать на дом",
                           bodyMessage: "Врач сам приедет к вам домой в указанное время и дату.",
                           selectedOption: $appoimentVIewModel.selectedOption,
                           format: .home)
            }
        }
    }
}
