//
//  CurrentWeatherDetailsStackCellVIEWMODEL.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 24.06.21.
//

import Foundation

struct WeatherDetialsStackItem {
    enum ViewType {
        case humidity
        case pressure
        case windSpeed
    }
    
    var imageTitle: String {
        switch viewType {
        case .humidity:
            return "waterDrop"
        case .pressure:
            return "barometer"
        case .windSpeed:
            return "wind"
        }
    }
    let viewType: ViewType
    let value: String
}

protocol CurrentWeatherDetailsStackCellViewModelProtocol: CellViewModeling {
    
}

final class CurrentWeatherDetailsStackCellViewModel: CellViewModeling {
    let reusableIdentifier: String = CurrentWeatherDetailsStackCell.identifier
    let stackItems: [WeatherDetialsStackItem]
    
    init(stackItems: [WeatherDetialsStackItem]) {
        self.stackItems = stackItems
    }
    
}
