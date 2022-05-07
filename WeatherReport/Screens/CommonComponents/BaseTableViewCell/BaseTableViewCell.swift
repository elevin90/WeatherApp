//
//  BaseTableViewCell.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 13.05.21.
//

import UIKit

public class BaseTableViewCell: UITableViewCell, NibLoadableView {
    static var identifier: String {
        return String(describing: self)
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    convenience init() {
        self.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() { }
}


