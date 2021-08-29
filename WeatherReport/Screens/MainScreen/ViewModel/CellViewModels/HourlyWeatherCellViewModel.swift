//
//  HourlyWeatherCellViewModel.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 6.08.21.
//

import Foundation

protocol HourlyWeatherCellViewModelProtocol {
    var title: String { get }
    var hourlyForecastInfo: [HourlyForecastCellInfo] { get }
    
}

enum WeatherCondition: String {
    case thunderstorm
    case drizzle
    case rain
    case snow
    case clear
    case clouds
}

struct HourlyForecastCellInfo {
    let time: String
    let temperature: String
    let imageTitle: String
}

class HourlyWeatherCellViewModel: CellViewModeling, HourlyWeatherCellViewModelProtocol {
    private let hourlyWeather: [HourlyWeather]
    let title: String
    let reusableIdentifier = HourlyWeatherCell.cellId
    
    lazy var hourlyForecastInfo: [HourlyForecastCellInfo] = {
        var hourlyForecastInfoTemp = [HourlyForecastCellInfo]()
        hourlyWeather.forEach{
            let time = DateConverter().hourMinutedateStringFrom(interval: $0.dt)
            let temperature = String(Int($0.temperature))
            var weatherState = ""
            if let firstWeather = $0.weather.first,
               let state = WeatherCondition(rawValue: firstWeather.state.lowercased()) {
                weatherState = state.rawValue
            }
            let hourlyInfo = HourlyForecastCellInfo(time: time,
                                                       temperature: temperature,
                                                       imageTitle: weatherState)
            
            hourlyForecastInfoTemp.append(hourlyInfo)
        }
        return hourlyForecastInfoTemp
    }()
    
    init(hourlyWeather: [HourlyWeather]) {
        self.hourlyWeather = hourlyWeather
        self.title = "Today".localized()
    }
}
