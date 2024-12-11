//
//  StepIndicator.swift
//  PhyDocTest
//
//  Created by Yerkebulan on 07.12.2024.
//

import SwiftUI

struct StepIndicator: View {
    let stepsNum: Int 
    @Binding var currentStep: Int
    var body: some View {
        HStack(spacing:8) {
            ForEach(0..<stepsNum, id: \.self) { item in
                Rectangle()
                    .fill(item < currentStep ? Color.mainBlue : Color.backGroundBlue)
                    .frame(width: 28, height: 6)
                    .cornerRadius(6)
                    .animation(.easeInOut(duration: 0.3), value: currentStep)
            }
        }
        
    }
}

#Preview {
    StepIndicator(stepsNum: 3, currentStep: .constant(1))
}
