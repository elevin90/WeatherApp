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
        let gradientColors = [UIColor.sunriseStartColor, UIColor.sunriseFinishColor]
        let time = getSunItemTimeStringFrom(interval: currentWeather.sunriseTime)
        return SunTimeItem(time: time,
                           gradientColors: gradientColors)
    }
    
    private func createSunsetItem() -> SunTimeItem {
        let gradientColors = [UIColor.sunsetStartColor, UIColor.sunsetFinishColor]
        let time = getSunItemTimeStringFrom(interval: currentWeather.sunsetTime)
        return SunTimeItem(time: time,
                           gradientColors: gradientColors)
    }
    
    private func getSunItemTimeStringFrom(interval: Int) -> String {
        return DateConverter().hourMinutedateStringFrom(interval: interval)
    }
}
