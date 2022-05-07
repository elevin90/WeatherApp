//
//  WeeklyWeatherCell.swift
//  WeatherReport
//
//  Created by YAUHENI LEVIN on 3.05.22.
//

import UIKit

final class WeeklyWeatherCell: BaseTableViewCell {
    private lazy var dayLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.appFont(type: .medium, size: 16)
        label.textColor = .white
        label.font = font
        label.text = "dayLabel"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dayTemperatureLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.appFont(type: .medium, size: 16)
        label.textColor = .white
        label.font = font
        label.text = "temperatureLabel"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nightTemperatureLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.appFont(type: .regular, size: 16)
        label.textColor = UIColor.white.withAlphaComponent(0.5)
        label.font = font
        label.text = "temperatureLabel"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setup() {
        super.setup()
        backgroundView?.backgroundColor = .clear
        backgroundColor = .clear
        setupDayLabel()
        setupTemperatureLabel()
    }
    
    private func setupDayLabel() {
        addSubview(dayLabel)
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            dayLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            dayLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                               constant: -(UIScreen.main.bounds.width / 2)),
            dayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22)
        ])
    }
    
    private func setupTemperatureLabel() {
        addSubview(nightTemperatureLabel)
        NSLayoutConstraint.activate([
            nightTemperatureLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            nightTemperatureLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            nightTemperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22)
        ])
        addSubview(dayTemperatureLabel)
        NSLayoutConstraint.activate([
            dayTemperatureLabel.centerYAnchor.constraint(equalTo: nightTemperatureLabel.centerYAnchor),
            dayTemperatureLabel.trailingAnchor.constraint(equalTo: nightTemperatureLabel.leadingAnchor, constant: -12)
        ])
    }
    
    func fetch(with dailyWeather: DailyWeatherInfo?) {
        dayLabel.text = dailyWeather?.day ?? ""
        dayTemperatureLabel.text = "\(dailyWeather?.dailyTemperature ?? 0)".appending("º")
        nightTemperatureLabel.text = "\(dailyWeather?.nightTemperature ?? 0)".appending("º")
        
    }
}
