//
//  ClientInfoView.swift
//  PhyDocTest
//
//  Created by Yerkebulan on 10.12.2024.
//

import SwiftUI

struct ClientInfoView: View {
    var defaultClientInfo: [clientInfo] = [
        .init(type: "ИИН", value: "051224500944"),
        .init(type: "ФИО", value: "Иванов Иван Иванович"),
        .init(type: "Дата рождения", value: "24.05.2000"),
        .init(type: "Телефон", value: "+7 901 234 5678")
    ]
    var body: some View {
        VStack(spacing:20) {
            ForEach(defaultClientInfo) { info in
                ClientInfoCell(info: info)
            }
        }
    }
}
