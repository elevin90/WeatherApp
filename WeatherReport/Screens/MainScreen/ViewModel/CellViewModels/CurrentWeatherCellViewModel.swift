//
//  CurrentWeatherCellViewModel.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 13.05.21.
//

import Foundation

struct WeatherDetails {
    let temperature: Double
    let feelsLike: Double
    let clouds: Double
    let windSpeed: Double
    let windDeg: Double
}

struct WeatherAdditionalDetials {
    let sunriseTime: Int
    let sunsetTime: Int
    let pressure: Double
    let humidity: Double
    let dewPoint: Double
    let uvi: Double
}

struct CurrentWeatherCellViewModel {
    let weather: WeatherDetails
    let additional: WeatherAdditionalDetials
}
