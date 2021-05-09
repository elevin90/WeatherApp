//
//  String+Extensions.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 8.05.21.
//

import Foundation


extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
