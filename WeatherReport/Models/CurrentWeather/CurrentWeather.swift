//
//  Current.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 2.05.21.
//

import Foundation

struct CurrentWeather: Codable {
    let dt: Int
    let sunriseTime: Int
    let sunsetTime: Int
    let temperature: Double
    let feelsLike: Double
    let pressure: Double
    let humidity: Double
    let dewPoint: Double
    let uvi: Double
    let clouds: Double
    let visibility: Double
    let windSpeed: Double
    let windDeg: Double
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case dt
        case sunriseTime = "sunrise"
        case sunsetTime = "sunset"
        case temperature = "temp"
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
    }
}
