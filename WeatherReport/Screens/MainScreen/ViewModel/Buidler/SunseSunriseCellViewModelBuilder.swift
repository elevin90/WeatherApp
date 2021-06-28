//
//  SunseSunriseCellViewModelBuilder.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 27.06.21.
//

import Foundation
import UIKit

protocol SunCellViewModelBuilderProtocol {
    func create() -> SunCellViewModel
}

class SunViewModelBuilder: SunCellViewModelBuilderProtocol  {
    private let currentWeather: CurrentWeather
    
    init(currentWeather: CurrentWeather) {
        self.currentWeather = currentWeather
    }
    
    func create() -> SunCellViewModel {
        return SunCellViewModel(sunriseItem: createSunriseItem(),
                                sunsetItem: createSunsetItem())
    }
    
    private func createSunriseItem() -> SunTimeItem {
        let gradientColors = [UIColor(red: 0.91, green: 0.67, blue: 0.58, alpha: 1.00),
                              UIColor(red: 0.94, green: 0.42, blue: 0.63, alpha: 1.00)]
        return SunTimeItem(time: DateConverter().hourMinutedateStringFrom(interval: currentWeather.sunriseTime),
                           gradientColors: gradientColors)
    }
    
    private func createSunsetItem() -> SunTimeItem {
        let gradientColors = [UIColor(red: 0.90, green: 0.87, blue: 0.76, alpha: 1.00),
                              UIColor(red: 0.97, green: 0.87, blue: 0.63, alpha: 1.00)]
        return SunTimeItem(time: DateConverter().hourMinutedateStringFrom(interval: currentWeather.sunsetTime),
                           gradientColors: gradientColors)
    }
}


