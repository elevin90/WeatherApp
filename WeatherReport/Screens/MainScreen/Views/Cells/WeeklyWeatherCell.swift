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
        let font = UIFont.appFont(type: .regular, size: 12)
        label.textColor = .white
        label.font = font
        label.text = "dayLabel"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.appFont(type: .regular, size: 14)
        label.textColor = .white
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
            dayLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            dayLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            dayLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                               constant: -(UIScreen.main.bounds.width / 2)),
            dayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12)
        ])
    }
    
    private func setupTemperatureLabel() {
        addSubview(temperatureLabel)
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            temperatureLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            temperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
    
    func fetch(with dailyWeather: DailyWeatherInfo?) {
        dayLabel.text = dailyWeather?.day ?? ""
        temperatureLabel.text = "\(dailyWeather?.dailyTemperature ?? 0)" 
    }
}
