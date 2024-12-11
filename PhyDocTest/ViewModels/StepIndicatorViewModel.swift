//
//  StepIndicatorViewModel.swift
//  PhyDocTest
//
//  Created by Yerkebulan on 10.12.2024.
//

import SwiftUI

class StepIndicatorViewModel: ObservableObject {
    @Published var totalSteps = 3
    @Published var currentStep = 1
    
    
    func nextStep() {
        if currentStep < totalSteps {
            currentStep += 1
        }
    }
    
    func prevStep() {
        if currentStep > 1 {
            currentStep -= 1
        }
    }
    
    
}


