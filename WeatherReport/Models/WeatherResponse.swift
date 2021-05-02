//
//  Welcome.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 2.05.21.
//

import Foundation

struct WeatherResponse: Codable {
    let latitude: Double
    let longtitude: Double
    let timezone: String
    let timezoneOffset: Int
    let currentWeather: CurrentWeather

    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longtitude = "lon"
        case timezone
        case timezoneOffset = "timezone_offset"
        case currentWeather = "current"
    }
}
