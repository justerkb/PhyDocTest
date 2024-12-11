//
//  SecondScreen.swift
//  PhyDocTest
//
//  Created by Yerkebulan on 07.12.2024.
//

import SwiftUI

struct PatientSelectionScreen: View {
    
    @EnvironmentObject var patientInfoViewMode: PatientInfoViewModel
    
    var body: some View {
        VStack {
            Text("Выберите кого хотите записать")
                .font(.custom("Onest", size: 32))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 32)
            
            VStack(spacing: 20) {
                PatientTypeSelector()
                    .environmentObject(patientInfoViewMode)
                if patientInfoViewMode.selectedClientType == .other {
                    EnterOtherPatientDetails()
                        .environmentObject(patientInfoViewMode)
                } else {
                    ClientInfoView()
                }
                
                Spacer()
            }
        }
        .padding(.horizontal, 20)
        .toolbar(.hidden)
    }
}

#Preview {
    PatientSelectionScreen()
}


