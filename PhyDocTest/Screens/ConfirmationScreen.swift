//
//  ConfirmationScreen.swift
//  PhyDocTest
//
//  Created by Yerkebulan on 11.12.2024.
//

import SwiftUI


//MARK: - CONFIRM SCREEN
struct ConfirmationScreen: View {
    
    @EnvironmentObject var patientViewModel: PatientInfoViewModel
    @EnvironmentObject var scheduleViewModel: ScheduleViewModel
    var body: some View {
        VStack {
            Text("Подтвердите запись")
                .font(.custom("Onest", size: 32))
                .frame(maxWidth: .infinity, alignment: .leading)
//                .background(Color.green)
                .padding(.bottom, 0)
            ErrorView()
                .padding(.bottom, 34)
            DoctorView(doctor: .init(name: "Оксана Михайловна", specialization: "Офтальмолог", city: "Шымкент", rating: 4.9, avatartUrl: "avatarURL"))
                .padding(.bottom, 16)
            HStack(spacing: 12) {
                KeyValueItem(key: "Время", value: DateFormatterUtility.getTime(from: scheduleViewModel.selectedSlot?.datetime ?? "") ?? "ошибка")
                KeyValueItem(key: "Дата", value:DateFormatterUtility.getDay(from: scheduleViewModel.selectedSlot?.datetime ?? "") ?? "ошибка")
                KeyValueItem(key: "ЦЕНА", value: "\(scheduleViewModel.selectedSlot?.price ?? 0)")

               
            }
            .padding(.bottom, 24)
            
            
            ClientInfoCell(info: .init(type: "Формат приема:", value: "Онлайн-консультация"))
                .padding(.bottom, 20)
            ClientInfoCell(info: .init(type: "Пациент:", value: "Иванов Иван"))
                .padding(.bottom, 26)
            CreditCardView(sum: scheduleViewModel.selectedSlot?.price ?? 0)

            Spacer()
        }
        .onAppear(perform: {
            print(scheduleViewModel.selectedSlot)
            print(patientViewModel.clientInfo)

        })
        .padding(.horizontal, 20)

    }

}



//MARK: - Doctor Model
struct Doctor {
    let name: String
    let specialization: String
    let city: String
    let rating: Double
    let avatartUrl: String
    
}

//MARK: - DOCTOR PROFILE VIEW
struct DoctorView: View {
    
    let doctor: Doctor
    
    
    var body: some View {
        HStack(spacing: 16) {
            Image("doctor")
                .resizable()
                .frame(width: 72, height: 72)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 0) {
                Text(doctor.name)
                    .foregroundStyle(.mainBlack)
                    .font(.custom("Onest-Bold", size: 16))
                    
                Text(doctor.specialization)
                    .foregroundStyle(.textGray)
                    .font(.custom("Onest-Regular", size: 16))
                HStack(spacing:4) {
                    Image(systemName: "star.fill")
                        .font(.custom("Onest-Regular", size: 16))
                        .foregroundStyle(Color.starGray)
                    Text(String(format: "%.1f", doctor.rating))
                        .font(.custom("Onest-Regular", size: 16))
                        .foregroundStyle(Color.textGray)
                    Ellipse()
                        .frame(width: 4, height: 4)
                        .foregroundStyle(Color.textGray)
                        .padding(.horizontal, 4)
                    Text(doctor.city)
                        .foregroundStyle(.textGray)
                        .font(.custom("Onest-Regular", size: 16))
                }
            }
            
            Image(systemName: "ellipsis.message")
                .foregroundStyle(.mainBlack)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 28)
                        .stroke(Color.mainGray, lineWidth: 2)
                )
            
            
        }
        

        .frame(maxWidth: .infinity)
    }
}
#Preview {
    ConfirmationScreen()
}


//MARK: - CREDIT CARD VIEW
struct CreditCardView: View {
    
    let sum: Int
    
    var body: some View {
        HStack(spacing: 16) {
            Image("Visa")
            VStack(alignment: .leading) {
                Text("•••• 4515")
                    .font(.custom("Onest-Bold", size: 16))
                Text("03/24")
                    .font(.custom("Onest-Regular", size: 14))
            }
            
            Spacer()

            
            Text("\(sum)₸")
                .font(.custom("Onest-Medium", size: 20))
            
            
            Image(systemName: "chevron.down")
                
        }
        .padding()
        .background(.backGray)
        .cornerRadius(16)
        
    }
}

//MARK: - SLOT VIEW
struct KeyValueItem: View {
    
    let key: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(key.uppercased())
                .font(.custom("Onest", size: 12).bold())
                .foregroundStyle(.textGray)
            Text(value)
                .font(.custom("Onest-Medium", size: 24))
                .foregroundStyle(.mainBlack)
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 8)
        .padding(.top, 12)
        .background(Color.backGray)
        .cornerRadius(12)
    }
}
