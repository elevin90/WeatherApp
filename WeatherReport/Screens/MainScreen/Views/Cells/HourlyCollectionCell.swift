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
        let font = UIFont.appFont(type: .medium, size: 16)
        label.textColor = .white
        label.font = font
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
        temperatureLabel.text = info.temperature.appending("º")
        weatherImageView.image = UIImage(named: info.imageTitle)
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
            timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupImage() {
        addSubview(weatherImageView)
        NSLayoutConstraint.activate([
            weatherImageView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 12),
            weatherImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupTemperatureLabel() {
        addSubview(temperatureLabel)
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor,
                                                  constant: 10),
            temperatureLabel.leftAnchor.constraint(equalTo: leftAnchor),
            temperatureLabel.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
}
