//
//  Schedule.swift
//  PhyDocTest
//
//  Created by Yerkebulan on 10.12.2024.
//

struct Schedule: Codable {
    let slots: [Slot]
}

struct Slot: Codable, Identifiable, Equatable {
    let id: Int
    let datetime: String
    let price: Int
}
