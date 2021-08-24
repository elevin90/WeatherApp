//
//  HourlyCollectionCell.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 6.08.21.
//

import UIKit

class HourlyCollectionCell: UICollectionViewCell {
    
    static let cellId = "HourlyCollectionCell"
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.appFont(type: .regular, size: 12)
        label.textColor = UIColor.white
        label.font = font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.appFont(type: .regular, size: 16)
        label.textColor = .white
        label.font = font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .green
        return imageView
    }()
    
    private lazy var bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTimeLabel()
        setupImage()
        setupTemperatureLabel()
        contentView.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func fetch(info: HourlyForecastCellInfo) {
        timeLabel.text = info.time
        temperatureLabel.text = info.temperature
        weatherImageView.backgroundColor = .green
    }
}

private extension HourlyCollectionCell {
    private func setupBGView() {
        addSubview(bgView)
        NSLayoutConstraint.activate([
            
        ])
    }
    
    private func setupTimeLabel() {
        addSubview(timeLabel)
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: topAnchor),
            timeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 22),
            timeLabel.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    private func setupImage() {
        addSubview(weatherImageView)
        NSLayoutConstraint.activate([
            weatherImageView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 4),
            weatherImageView.leftAnchor.constraint(equalTo: timeLabel.leftAnchor),
            weatherImageView.widthAnchor.constraint(equalToConstant: 24),
            weatherImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func setupTemperatureLabel() {
        addSubview(temperatureLabel)
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor,
                                                  constant: 4),
            temperatureLabel.leftAnchor.constraint(equalTo: timeLabel.leftAnchor),
            temperatureLabel.rightAnchor.constraint(equalTo: timeLabel.rightAnchor)
        ])
    }
}
