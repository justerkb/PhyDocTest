//
//  PatientTypeSelector.swift
//  PhyDocTest
//
//  Created by Yerkebulan on 11.12.2024.
//
import SwiftUI

struct PatientTypeSelector: View {
    @EnvironmentObject var vm: PatientInfoViewModel
    
    var body: some View {
        HStack(spacing: 12) {
            Button {
                vm.selectedClientType = .selfPerson
            } label: {
                Text("Себя")
                    .foregroundStyle(vm.selectedClientType == .other ? Color.black : Color.white)
                    .font(.custom("Onest-bold", size: 16))
                    .padding(.vertical, 12)
            }
            .frame(maxWidth: .infinity)
            .background(vm.selectedClientType == .selfPerson ? Color.mainBlue : .clear)
            .cornerRadius(10)
            .padding(6)
            
            Button {
                vm.selectedClientType = .other
            } label: {
                Text("Другого")
                    .foregroundStyle(vm.selectedClientType == .selfPerson ? Color.black : Color.white)
                    .font(.custom("Onest-bold", size: 16))
                    .padding(.vertical, 12)
            }
            .frame(maxWidth: .infinity)
            .background(vm.selectedClientType == .other ? Color.mainBlue : .clear)
            .cornerRadius(10)
            .padding(6)
        }
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.mainGray)
        )
    }
}
