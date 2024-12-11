//
//  AppointmentFlowViewModel .swift
//  PhyDocTest
//
//  Created by Yerkebulan on 07.12.2024.
//

import SwiftUI
enum Screen {
    case appoimentFormat
    case selectClient
    case schedule
    case confirmation
    case success
}

class NavigationViewModel: ObservableObject {
    @Published var currentStepIndex: Int = 0
    
    
    private let screens: [Screen] = [.appoimentFormat, .selectClient, .schedule, .confirmation, .success]
    
    var currentScreen: Screen {
        screens[currentStepIndex]
    }
    
    func nextScreen() {
        if currentStepIndex < screens.count - 1 {
            currentStepIndex += 1
        }
    }
    
    func previousScreen() {
        if currentStepIndex > 0 {
            currentStepIndex -= 1
        }
    }
    
}

