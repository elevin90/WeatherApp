//
//  DateConverter.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 27.06.21.
//

import Foundation

class DateConverter {
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return dateFormatter
    }()
    
    
    func hourMinutedateStringFrom(interval: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(interval))
        let localDateString = dateFormatter.string(from: date)
        guard let localDate = dateFormatter.date(from: localDateString) else {
            return ""
        }
        let calendar = Calendar.current
        let comp = calendar.dateComponents([.hour, .minute], from: localDate)
        let hour = comp.hour ?? 0
        let minute = comp.minute ?? 0
        return "\(hour):\(minute)"
    }
    
}
