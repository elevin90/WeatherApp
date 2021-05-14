//
//  CurrentLocationCell.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 14.05.21.
//

import UIKit

protocol CurrentLocationCellFetching {
    func fetch(with viewModel: CurrentLocationViewModel)
}

class CurrentLocationCell: BaseTableViewCell {
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        let font = UIFont.appFont(type: .medium, size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var currentDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white.withAlphaComponent(0.6)
        let font = UIFont.appFont(type: .regular, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setup() {
        setupCityLabel()
        setupCurrentDateLabel()
    }
}

private extension CurrentLocationCell {
    private func setupCityLabel() {
        addSubview(cityLabel)
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            cityLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            cityLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -50),
        ])
    }
    
    private func setupCurrentDateLabel() {
        addSubview(currentDateLabel)
        NSLayoutConstraint.activate([
            currentDateLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 4),
            currentDateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            currentDateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -50),
            currentDateLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension CurrentLocationCell: CurrentLocationCellFetching {
    func fetch(with viewModel: CurrentLocationViewModel) {
        cityLabel.text = viewModel.placemark.city
        currentDateLabel.text = viewModel.dateString
    }
}
