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
    
    init(viewType: ViewType, value: Double) {
        self.viewType = viewType
        switch viewType {
        case .humidity:
            self.value = String(format:  "\(Int(value))", value).appending("%")
        case .pressure:
            self.value = String(format: "\(Int(value))".appending("hPa".localized()), value)
        case .windSpeed:
            self.value = value < 1
                ? String(format: "%.2f".appending("m/s".localized()), value)
                : String(format: "\(Int(value))".appending("m/s".localized()), value)
        }
    }
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
