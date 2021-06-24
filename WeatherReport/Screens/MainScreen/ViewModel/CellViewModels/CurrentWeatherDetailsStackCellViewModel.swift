//
//  CurrentWeatherDetailsStackCellVIEWMODEL.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 24.06.21.
//

import Foundation

struct WeatherDetialsStackInfo {
    enum ViewType {
        case humidity
        case pressure
        case windSpeed
    }
    
    var imageTitle: String {
        switch viewType {
        case .humidity:
            
        case .pressure:
            
        case .windSpeed:
            
        }
    }
    let viewType: ViewType
}

protocol CurrentWeatherDetailsStackCellViewModelProtocol: CellViewModeling

class CurrentWeatherDetailsStackCellViewModel: CellViewModeling {
    let reusableIdentifier: String = CurrentWeatherDetailsStackCell.identifier
    
}
