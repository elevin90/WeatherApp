//
//  Weather.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 2.05.21.
//

import Foundation

struct Weather: Codable {
    let id: Int
    let state: String
    let description: String
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case state = "main"
        case description
        case icon
    }
}
