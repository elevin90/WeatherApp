//
//  BlurView.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 27.06.21.
//

import UIKit

class GradientView: UIView {
    let gradientLayer = CAGradientLayer()
    var colors = [UIColor]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        update()
        gradientLayer.frame = bounds
        if gradientLayer.superlayer == nil {
            layer.insertSublayer(gradientLayer, at: 0)
        }
    }
    
    func update() {
        gradientLayer.colors = colors.map{$0.cgColor}
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
