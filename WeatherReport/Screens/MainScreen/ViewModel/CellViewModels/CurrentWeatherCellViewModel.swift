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
    let description: String
    let state: String
}

struct WeatherAdditionalDetials {
    let sunriseTime: Int
    let sunsetTime: Int
    let pressure: Double
    let humidity: Double
    let dewPoint: Double
    let uvi: Double
}

class CurrentWeatherCellViewModel: CellViewModeling {
    let weather: WeatherDetails
    let additional: WeatherAdditionalDetials
    let reusableIdentifier: String = CurrentWeatherCell.identifier
    
    init(weather: WeatherDetails, additional: WeatherAdditionalDetials) {
        self.weather = weather
        self.additional = additional
    }
}
