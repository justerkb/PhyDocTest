//
//  ContentView.swift
//  PhyDocTest
//
//  Created by Yerkebulan on 07.12.2024.
//

import SwiftUI

struct MainContainerScreen: View {
    
    @StateObject var navigationViewModel = NavigationViewModel()
    @StateObject var stepIndicatorViewModel = StepIndicatorViewModel()
    @StateObject var scheduleViewModel = ScheduleViewModel()
    @StateObject var patientViewModel = PatientInfoViewModel()
    @StateObject var appoimentFormatViewModel = AppoimentFormatViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            if navigationViewModel.currentScreen == .success {
                SuccesScreen()
                    .ignoresSafeArea()
            } else {
                
                VStack {
                    StepIndicator(stepsNum: stepIndicatorViewModel.totalSteps, currentStep: $stepIndicatorViewModel.currentStep)
                        .padding(.top, 20)
                    
                    switch navigationViewModel.currentScreen {
                    case .appoimentFormat:
                        AppointmentFormatSelectionView()
                            .environmentObject(appoimentFormatViewModel)
                    case .selectClient:
                        PatientSelectionScreen()
                            .environmentObject(patientViewModel)
                        
                    case .schedule:
                        DateSelectingScreen()
                            .environmentObject(appoimentFormatViewModel)
                            .environmentObject(scheduleViewModel)
                    case .confirmation:
                        ConfirmationScreen()
                            .environmentObject(scheduleViewModel)
                            .environmentObject(patientViewModel)
                            .environmentObject(appoimentFormatViewModel)
                    case .success:
                        EmptyView()
                    }
                    
                    Spacer()
                    
                    NavigationButtons()
                        .environmentObject(navigationViewModel)
                        .environmentObject(stepIndicatorViewModel)
                        .environmentObject(scheduleViewModel)
                        .environmentObject(appoimentFormatViewModel)
                }
            }
        }
    }
    
}

#Preview {
    MainContainerScreen()
}
