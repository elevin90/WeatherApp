//
//  BaseTableViewCell.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 13.05.21.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    convenience init() {
        self.init(frame: .zero)
        setup()
    }
    
    func setup() { }
}


