//
//  NavigationButtons.swift
//  PhyDocTest
//
//  Created by Yerkebulan on 09.12.2024.
//

import SwiftUI

struct NavigationButtons: View {
    @EnvironmentObject var navigationViewModel: NavigationViewModel
    @EnvironmentObject var stepIndicatorViewModel: StepIndicatorViewModel
    @EnvironmentObject var scheduleViewModel: ScheduleViewModel
    @EnvironmentObject var appointmentViewModel: AppoimentFormatViewModel

    var body: some View {
        HStack(spacing: 12) {
            
            Button {
                navigationViewModel.previousScreen()
                stepIndicatorViewModel.prevStep()
                
            } label: {
                
                HStack(spacing: 8) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 16, weight: .bold))
                    Text("Назад")
                        .font(.custom("Onest", size: 16).bold())
                        .foregroundColor(Color.mainBlack)
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
                .background(
                    Capsule()
                        .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                )
            }
            .buttonStyle(PlainButtonStyle())
            
            
            Button {
                if navigationViewModel.currentScreen == .confirmation {
                    guard let slot = scheduleViewModel.selectedSlot else { return }
                    NetworkManager.shared.createAppointment(appoiment: .init(slotId: slot.id, type: appointmentViewModel.selecedOptionType)) { result in
                        switch result {

                        case .success(let mes):
                            print(mes)
                        case .failure(let e):
                            print(e)
                        }
                    }
                    
                }
                navigationViewModel.nextScreen()
                stepIndicatorViewModel.nextStep()
            } label: {
                Text("Дальше")
                    .font(.custom("Onest-Bold", size: 16))
                    .foregroundStyle(.white)
                    .cornerRadius(30)
                    .padding(.vertical, 17)
                    .frame(maxWidth: .infinity)
                    .background(
                        
                        (scheduleViewModel.selectedSlot == nil && navigationViewModel.currentScreen == .schedule) ? Color.thirdGray : Color.mainBlue
                    )
                    .cornerRadius(28)
                    .onAppear {
                        print("Selected Slot: \(String(describing: scheduleViewModel.selectedSlot))")
                        print("Current Screen: \(navigationViewModel.currentScreen)")
                    }
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    NavigationButtons()
}
