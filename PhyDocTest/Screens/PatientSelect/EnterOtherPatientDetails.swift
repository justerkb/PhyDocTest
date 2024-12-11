//
//  s.swift
//  PhyDocTest
//
//  Created by Yerkebulan on 10.12.2024.
//

import SwiftUI

struct EnterOtherPatientDetails: View {
    @EnvironmentObject var vm: PatientInfoViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            
            TextInputField(headerText: "Имя фамилия", text: $vm.clientInfo.name, placeholder: "Иван Иванов")
            TextInputField(headerText: "ИИН", text: $vm.clientInfo.IIN, placeholder: "Введите иин человека")
            TextInputField(headerText: "Номер телефона", text: $vm.clientInfo.phone, placeholder: "Введите номер телефона")
            TextInputField(headerText: "Адресс", text: $vm.clientInfo.address, placeholder: "Адресс прописки")
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
