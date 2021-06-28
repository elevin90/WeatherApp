//
//  File.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 27.06.21.
//

import UIKit

struct SunTimeItem {
    let time: String
    let gradientColors: [UIColor]
}

final class SunCellViewModel: CellViewModeling {
    let reusableIdentifier = "SunsetSunriseCell"
    let sunriseItem: SunTimeItem
    let sunsetItem: SunTimeItem
    
    init(sunriseItem: SunTimeItem, sunsetItem: SunTimeItem) {
        self.sunriseItem = sunriseItem
        self.sunsetItem = sunsetItem
    }
}
