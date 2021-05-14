//
//  UITableView.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 14.05.21.
//

import UIKit

public protocol NibLoadableView {
    static var nibName: String { get }
    static var nib: UINib { get }
}

public extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: Bundle(for: self))
    }
    
    static var instantiate: Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("Could not load:\(nib), of type \(self)")
        }
        return view
    }
}

extension UITableView {
    public func register<T: BaseTableViewCell>(_: T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.identifier)
    }
}

