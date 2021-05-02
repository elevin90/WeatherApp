//
//  Current.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 2.05.21.
//

import Foundation

class Current: Codable {
    let dt: Int
        let sunrise, sunset: Int?
        let temp, feelsLike: Double
        let pressure, humidity: Int
        let dewPoint, uvi: Double
        let clouds, visibility: Int
        let windSpeed: Double
        let windDeg: Int
        let weather: [Weather]
        let windGust, pop: Double?
        let rain: Rain?
    
    enum CodingKeys: String, CodingKey {
            case dt, sunrise, sunset, temp
            case feelsLike = "feels_like"
            case pressure, humidity
            case dewPoint = "dew_point"
            case uvi, clouds, visibility
            case windSpeed = "wind_speed"
            case windDeg = "wind_deg"
            case weather
            case windGust = "wind_gust"
            case pop, rain
        }
}
