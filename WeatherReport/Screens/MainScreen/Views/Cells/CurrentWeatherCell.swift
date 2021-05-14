//
//  CurrentWeatherCell.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 13.05.21.
//

import UIKit

protocol CurrentWeatherCellFetching {
    func fetch(with viewModel: CurrentWeatherCellViewModel)
}

final class CurrentWeatherCell: BaseTableViewCell {
    private lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        let font = UIFont.appFont(type: .medium, size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var degreesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        let font = UIFont.appFont(type: .regular, size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var conditionsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        let font = UIFont.appFont(type: .regular, size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setup() {
        super.setup()
        setupCityLabel()
        setupDegreesLabel()
        setupConditionsLabel()
    }
}

private extension CurrentWeatherCell {
    private func setupCityLabel() {
        addSubview(cityLabel)
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            cityLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            cityLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -50),
        ])
    }

    
    private func setupDegreesLabel() {
        addSubview(degreesLabel)
        NSLayoutConstraint.activate([
            degreesLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 6),
            degreesLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12)
        ])
    }
    
    private func setupConditionsLabel() {
        addSubview(conditionsLabel)
        NSLayoutConstraint.activate([
            conditionsLabel.topAnchor.constraint(equalTo: degreesLabel.bottomAnchor, constant: 6),
            conditionsLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12)
        ])
    }
}

extension CurrentWeatherCell: CurrentWeatherCellFetching {
    func fetch(with viewModel: CurrentWeatherCellViewModel) {

    }
}
