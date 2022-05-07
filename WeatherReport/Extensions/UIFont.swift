//
//  UIFont.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 13.05.21.
//

import UIKit

enum FontFamily {
    case regular
    case thin
    case light
    case medium
    case bold
}

extension UIFont {
    static func appFont(type: FontFamily, size: CGFloat) -> UIFont? {
        switch type {
        case .bold:
            return UIFont(name: "Roboto-Bold", size: size)
        case .light:
            return UIFont(name: "Roboto-Light", size: size)
        case .medium:
            return UIFont(name: "Roboto-Medium", size: size)
        case .regular:
            return UIFont(name: "Roboto-Regular", size: size)
        case .thin:
            return UIFont(name: "Roboto-Thin", size: size)
        }
    }
}
