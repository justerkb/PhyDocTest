//
//  AppoimentFormatViewModel.swift
//  PhyDocTest
//
//  Created by Yerkebulan on 11.12.2024.
//

import SwiftUI

class AppoimentFormatViewModel: ObservableObject {
    @Published var selectedOption: AppointmentFormat = .online

    var selecedOptionType: String {
        switch selectedOption {
        case .online:
            return "online"
        default:
            return "offline"
        }
    }
}
