//
//  CurrentWeatherDetailsStackCell.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 24.06.21.
//

import UIKit

final class CurrentWeatherDetailsStackCell: BaseTableViewCell {
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .vertical
        stackView.isUserInteractionEnabled = false
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
}
