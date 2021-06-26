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
        stackView.axis = .horizontal
        stackView.isUserInteractionEnabled = false
        stackView.alignment = .fill
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func setup() {
        super.setup()
        backgroundColor = .clear
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -12)
        ])
    }
}

extension CurrentWeatherDetailsStackCell: TableCellFetching {
    func fetch(with viewModel: CellViewModeling) {
        guard let viewModel = viewModel as? CurrentWeatherDetailsStackCellViewModel
        else { return }
        viewModel.stackItems.forEach {
            let view = DetailsStackItemView()
            view.fetchWith(item: $0)
            stackView.addArrangedSubview(view)
        }
    }
}
