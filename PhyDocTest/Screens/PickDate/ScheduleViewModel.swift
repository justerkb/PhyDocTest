//
//  ScheduleViewModel.swift
//  PhyDocTest
//
//  Created by Yerkebulan on 11.12.2024.
//

import SwiftUI

class ScheduleViewModel: ObservableObject {
    @Published var slotsByDate: [String: [Slot]] = [:]
    @Published var selectedSlot: Slot?
    
    private let dateFormatter = DateFormatter()
    
    func fetchSchedule(type: String) {
        NetworkManager.shared.getSchedule(completion: { result in
            switch result {
            case .success(let result):
                self.organizeSlotsByDate(result.slots)
            case .failure(let error):
                print(error)
            }
        }, type: type)
    }
    
    
    private func organizeSlotsByDate(_ slots: [Slot]) {
        

        var groupedSlots: [String: [Slot]] = [:]

        for slot in slots {
            guard let date = parseDate(slot.datetime) else { continue }
            let dateKey = formatDate(date)

            if groupedSlots[dateKey] != nil {
                groupedSlots[dateKey]?.append(slot)
            } else {
                groupedSlots[dateKey] = [slot]
            }
        }

        DispatchQueue.main.async {
            self.slotsByDate = groupedSlots
           

        }
    }
    
    private func parseDate(_ datetime: String) -> Date? {
        let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            inputFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            let parsedDate = inputFormatter.date(from: datetime)
            return parsedDate
    }

    private func formatDate(_ date: Date) -> String {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "d MMMM, EEEE"
        return outputFormatter.string(from: date)
    }
}
