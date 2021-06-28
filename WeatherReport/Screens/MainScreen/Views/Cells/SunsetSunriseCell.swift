//
//  SunsetSunriseCell.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 27.06.21.
//

import UIKit

class SunsetSunriseCell: BaseTableViewCell {
    private lazy var sunriseView: GradientView = {
        let view = GradientView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sunsetView: GradientView = {
        let view = GradientView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sunriseLabel: UILabel = {
        let label = UILabel()
        let textColor = UIColor.white.withAlphaComponent(0.8)
        let font = UIFont.appFont(type: .regular, size: 14)
        label.textColor = textColor
        label.font = font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sunsetLabel: UILabel = {
        let label = UILabel()
        let textColor = UIColor.white.withAlphaComponent(0.8)
        let font = UIFont.appFont(type: .regular, size: 14)
        label.textColor = textColor
        label.font = font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setup() {
        backgroundColor = .clear
        setupSunriseView()
        setupSunsetView()
        setupLabels()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let cornerRadius = sunriseView.bounds.width / 2
        sunriseView.layer.cornerRadius = cornerRadius
        sunriseView.layer.sublayers?.forEach{
            $0.cornerRadius = cornerRadius
        }
        sunsetView.layer.cornerRadius = cornerRadius
        sunsetView.layer.sublayers?.forEach{
            $0.cornerRadius = cornerRadius
        }
    }
}

private extension SunsetSunriseCell {
    private func setupSunsetView() {
        addSubview(sunsetView)
        NSLayoutConstraint.activate([
            sunsetView.topAnchor.constraint(equalTo: topAnchor, constant: 42),
            sunsetView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            sunsetView.rightAnchor.constraint(equalTo: rightAnchor, constant: -22),
            sunsetView.heightAnchor.constraint(equalToConstant: 20),
            sunsetView.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupSunriseView() {
        addSubview(sunriseView)
        NSLayoutConstraint.activate([
            sunriseView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            sunriseView.leftAnchor.constraint(equalTo: leftAnchor, constant: 22),
            sunriseView.heightAnchor.constraint(equalToConstant: 20),
            sunriseView.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupLabels() {
        addSubview(sunriseLabel)
        NSLayoutConstraint.activate([
            sunriseLabel.centerYAnchor.constraint(equalTo: sunriseView.centerYAnchor),
        
            sunriseLabel.leftAnchor.constraint(equalTo: sunriseView.rightAnchor,
                                             constant: 8)
        ])
        
        addSubview(sunsetLabel)
        NSLayoutConstraint.activate([
            sunsetLabel.centerYAnchor.constraint(equalTo: sunsetView.centerYAnchor),
        
            sunsetLabel.rightAnchor.constraint(equalTo: sunsetView.leftAnchor,
                                             constant: -8)
        ])
    }
}


extension SunsetSunriseCell: TableCellFetching {
    func fetch(with viewModel: CellViewModeling) {
        guard let viewModel = viewModel as? SunCellViewModel else { return }
        sunsetLabel.text = viewModel.sunsetItem.time
        sunriseLabel.text = viewModel.sunriseItem.time
        sunriseView.colors = viewModel.sunriseItem.gradientColors
        sunsetView.colors = viewModel.sunsetItem.gradientColors
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 100, y: 20))
        path.addLine(to: CGPoint(x: 150, y: 50))
    }
}
