//
//  CurrentWeatherCell.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 13.05.21.
//

import UIKit

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
        let font = UIFont.appFont(type: .bold, size: 32)
        label.font = font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var conditionsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        let font = UIFont.appFont(type: .regular, size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setup() {
        super.setup()
        backgroundColor = .clear
        setupDegreesLabel()
        setupConditionsLabel()
    }
}

private extension CurrentWeatherCell {
    private func setupDegreesLabel() {
        addSubview(degreesLabel)
        NSLayoutConstraint.activate([
            degreesLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            degreesLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 22)
        ])
    }
    
    private func setupConditionsLabel() {
        addSubview(conditionsLabel)
        NSLayoutConstraint.activate([
            conditionsLabel.topAnchor.constraint(equalTo: degreesLabel.bottomAnchor, constant: 4),
            conditionsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            conditionsLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 22),
            conditionsLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -22)
        ])
    }
}

extension CurrentWeatherCell: TableCellFetching {
    func fetch(with viewModel: CellViewModeling) {
        guard let viewModel = viewModel as? CurrentWeatherCellViewModel else { return }
        degreesLabel.text = viewModel.temperatureString
        conditionsLabel.text = viewModel.conditions
    }
}
