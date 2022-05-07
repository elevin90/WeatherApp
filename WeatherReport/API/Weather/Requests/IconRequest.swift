//
//  IconRequest.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 13.06.21.
//

//TODO: MAke director and buidelrs for requests
import Foundation

class IconRequest: WeatherRequest {
    init(title: String) {
        let endPoint = "/img/wn/\(title)@2x.png"
        super.init(endPoint: endPoint, method: .get)
    }
}
