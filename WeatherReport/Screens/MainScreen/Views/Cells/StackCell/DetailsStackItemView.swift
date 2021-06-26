//
//  DetailsStackItemView.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 26.06.21.
//

import UIKit

final class DetailsStackItemView: UIView {
   private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        let textColor = UIColor.white.withAlphaComponent(0.8)
        let font = UIFont.appFont(type: .regular, size: 12)
        label.textColor = textColor
        label.font = font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
        setupTitleLabel()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func fetchWith(item: WeatherDetialsStackItem) {
        imageView.image = UIImage(named: item.imageTitle)
        titleLabel.text = item.value
    }
}


private extension DetailsStackItemView {
    private func setupImageView() {
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor,
                                             constant: 12),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
}
