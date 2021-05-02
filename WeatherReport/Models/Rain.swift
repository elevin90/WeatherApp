//
//  Rain.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 2.05.21.
//

import Foundation

struct Rain: Codable {
    let nextHour: Double
    
    enum CodingKeys: String, CodingKey {
        case nextHour = "1h"
    }
}
