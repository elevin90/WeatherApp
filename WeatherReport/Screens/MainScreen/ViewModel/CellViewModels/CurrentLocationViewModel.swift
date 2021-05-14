//
//  CurrentLocationViewModel.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 14.05.21.
//

import Foundation

protocol CellViewModeling {
    var reusableIdentifier: String { get }
}

class CurrentLocationViewModel: CellViewModeling {
    let placemark: Placemark
    let reusableIdentifier: String = CurrentLocationCell.identifier
    
    lazy var dateString: String = {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateStyle = .long
        let dateString = dateFormatter.string(from: currentDate)
        return dateString
    }()
    
    init(placemark: Placemark) {
        self.placemark = placemark
    }
}
