//
//  Location.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 6.05.21.
//

import Foundation

class Location {
    let latitude: Double
    let longtitude: Double
    
    lazy var latitudeString: String = {
        return String(self.latitude)
    }()
    
    lazy var longtitudeString: String = {
        return String(self.longtitude)
    }()
    
    init(latitude: Double, longtitude: Double) {
        self.latitude = latitude
        self.longtitude = longtitude
    }
}
