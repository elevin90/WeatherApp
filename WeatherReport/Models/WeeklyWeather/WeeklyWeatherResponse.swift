//
//  WeeklyWeatherResponse.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 23.01.22.
//

import Foundation

struct WeeklyWeatherResponse: Codable {
    let city: City
    let code: String
    let message: Float
    let count: Int
    let list: [DailyWeather]
    
    enum CodingKeys: String, CodingKey {
        case code = "cod"
        case count = "cnt"
        case city, message, list
    }
}

struct City: Codable {
    let id: Int
    let name: String
    let coordinates: Coordinates
    let country: String
    let population: Int
    let timezone: UInt
    
    enum CodingKeys: String, CodingKey {
        case coordinates = "coord"
        case id, name, country, population, timezone
    }
}

struct Coordinates: Codable {
    let latitude: Float
    let longtitude: Float
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longtitude = "lon"
    }
}

struct DailyWeather: Codable {
    let time: Int
    let sunriseTime: UInt
    let sunsetTime: UInt
    let temperature: DailyTemperature
    let feelsLike: FeelsLike
    let pressure: Float
    let humidity: Float
    let weather: [Weather]
    let speed: Float
    let degree: Float
    let windGust: Float
    let clouds: Float
    let probabilityOfPrecipitation: Float
    
    enum CodingKeys: String, CodingKey {
        case time = "dt"
        case sunriseTime = "sunrise"
        case sunsetTime = "sunset"
        case temperature = "temp"
        case feelsLike = "feels_like"
        case degree = "deg"
        case windGust = "gust"
        case probabilityOfPrecipitation = "pop"
        case pressure, humidity, weather, speed, clouds
    }
}

struct DailyTemperature: Codable {
    let dayTemperature: Float
    let minimal: Float
    let maximal: Float
    let nightTemperature: Float
    let eveningTemperature: Float
    let morningTemperature: Float
    
    enum CodingKeys: String, CodingKey {
        case dayTemperature = "day"
        case minimal = "min"
        case maximal = "max"
        case nightTemperature = "night"
        case eveningTemperature = "eve"
        case morningTemperature = "morn"
    }
}

struct FeelsLike: Codable {
    let day: Float
    let night: Float
    let evening: Float
    let morning: Float
    
    enum CodingKeys: String, CodingKey {
        case evening = "eve"
        case morning = "morn"
        case day, night
    }
}
