//
//  SelectClientViewModel.swift
//  PhyDocTest
//
//  Created by Yerkebulan on 10.12.2024.
//

import Foundation
import Foundation

class PatientInfoViewModel: ObservableObject {
    
    struct DefaultClientInfo {
        static let selfPerson = ClientInfo(
            name: "Иванов Иван",
            IIN: "041115486195",
            phone: "+7 707 748 4815",
            address: "ул. Гани Иляева 15"
        )
        
        static let other = ClientInfo(
            name: "",
            IIN: "",
            phone: "",
            address: ""
        )
    }
    
    enum ClientType {
        case selfPerson
        case other
    }
    
    @Published var clientInfo: ClientInfo
    @Published var selectedClientType: ClientType = .selfPerson {
        didSet {
            updateClientInfo()
        }
    }
    
    init(clientInfo: ClientInfo = DefaultClientInfo.selfPerson) {
        self.clientInfo = clientInfo
    }
    
    private func updateClientInfo() {
        switch selectedClientType {
        case .selfPerson:
            clientInfo = DefaultClientInfo.selfPerson
        case .other:
            clientInfo = DefaultClientInfo.other
        }
    }
}
