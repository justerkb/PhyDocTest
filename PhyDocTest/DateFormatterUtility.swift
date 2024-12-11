//
//  DateFormatterUtility.swift
//  PhyDocTest
//
//  Created by Yerkebulan on 11.12.2024.
//

import Foundation

struct DateFormatterUtility {
    
    
    public static func getTime(from string: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        inputFormatter.timeZone = TimeZone(secondsFromGMT: 0)

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "HH:mm"

        if let date = inputFormatter.date(from: string) {
            return outputFormatter.string(from: date)
        }
        return nil
    }

    public static func getDay(from string: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        inputFormatter.timeZone = TimeZone(secondsFromGMT: 0)

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "d MMM"

        if let date = inputFormatter.date(from: string) {
            return outputFormatter.string(from: date)
        }
        return nil
    }
}
