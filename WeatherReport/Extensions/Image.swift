//
//  Image.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 13.06.21.
//

import UIKit

public enum WeatherImage {
    case sun
    case clouds
    case rain
    case lightning
}

public enum TabBarImage {
    case main
    case saved
    case settings
}

public enum Image {
    case weatherImage(WeatherImage)
    case tabBar(TabBarImage)
}


extension Image {
    func get() -> UIImage? {
        switch self {
        case .weatherImage(let type):
            if type == .sun {
                return UIImage(systemName: "sun.max")
            } else if type  == .clouds {
                return UIImage(systemName: "cloud")
            } else if type  == .rain {
                return UIImage(systemName: "cloud.rain")
            } else {
                return UIImage(systemName: "cloud.bolt")
            }
        default:
            return nil
        }
    }
}
