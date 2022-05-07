//
//  HourlyWeather.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 6.08.21.
//

import Foundation

struct HourlyWeather: Codable {
    let dt: Int
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
    let probability: Double
    let rain: Rain?
    
    enum CodingKeys: String, CodingKey {
        case dt
        case temperature = "temp"
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
        case probability = "pop"
        case rain = "rain"
    }
}

struct Rain: Codable {
    let hour: Double
    
    enum CodingKeys: String, CodingKey {
        case hour = "1h"
    }
}
