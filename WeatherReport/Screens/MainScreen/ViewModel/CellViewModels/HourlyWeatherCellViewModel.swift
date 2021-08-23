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
            let hourlyInfo = HourlyForecastCellInfo(time: time,
                                                       temperature: temperature,
                                                       imageTitle: "")
            
            hourlyForecastInfoTemp.append(hourlyInfo)
        }
        return hourlyForecastInfoTemp
    }()
    
    init(hourlyWeather: [HourlyWeather]) {
        self.hourlyWeather = hourlyWeather
        self.title = "Today".localized()
    }
}
