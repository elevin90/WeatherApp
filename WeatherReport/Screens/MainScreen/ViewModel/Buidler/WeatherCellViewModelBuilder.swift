//
//  WeatherCellViewModelBuilder.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 13.06.21.
//

import Foundation

protocol WeatherCellViewModelBuilderProtocol {
    func create() -> CurrentWeatherCellViewModel
}

final class WeatherCellViewModelBuilder: WeatherCellViewModelBuilderProtocol {
    private let currentWeather: CurrentWeather
    
    init(currentWeather: CurrentWeather) {
        self.currentWeather = currentWeather
    }
    
    private func createWeatherDetails() -> WeatherDetails {
        return .init(temperature: currentWeather.temperature,
                     feelsLike: currentWeather.feelsLike,
                     clouds: currentWeather.clouds,
                     windSpeed: currentWeather.windSpeed,
                     windDeg: currentWeather.windDeg,
                     description: currentWeather.weather.first?.weatherDescription ?? "",
                     state: currentWeather.weather.first?.state ?? "")
    }
    
    private func createWeatherInfo()-> WeatherAdditionalDetials {
        return  .init(sunriseTime: currentWeather.sunriseTime,
                      sunsetTime: currentWeather.sunsetTime,
                      pressure: currentWeather.pressure,
                      humidity: currentWeather.humidity,
                      dewPoint: currentWeather.dewPoint,
                      uvi: currentWeather.dewPoint)
    }
    
    func create() -> CurrentWeatherCellViewModel {
        return .init(weather: createWeatherDetails(),
                     additional: createWeatherInfo())
    }
}
