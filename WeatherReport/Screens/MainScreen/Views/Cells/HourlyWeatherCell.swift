//
//  HourlyWeathreCell.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 6.08.21.
//

import UIKit

class HourlyWeatherCell: BaseTableViewCell {
    
    static let cellId = "HourlyWeatherCell"
    
    private var viewModel: HourlyWeatherCellViewModelProtocol?
    
    private lazy var todayLabel: UILabel = {
        let label = UILabel()
        let textColor = UIColor.white.withAlphaComponent(0.8)
        let font = UIFont.appFont(type: .regular, size: 14)
        label.textColor = textColor
        label.font = font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 60, height: 78)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isUserInteractionEnabled = true
        collectionView.dataSource = self
        collectionView.register(HourlyCollectionCell.self,
                                forCellWithReuseIdentifier: HourlyCollectionCell.cellId)
        collectionView.isUserInteractionEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.backgroundView?.backgroundColor = .clear
        return collectionView
    }()
    
    override func setup() {
        setupTodayLabel()
        setupCollectionView()
    }
}

private extension HourlyWeatherCell {
    private func setupTodayLabel() {
        addSubview(todayLabel)
        NSLayoutConstraint.activate([
            todayLabel.topAnchor.constraint(equalTo: topAnchor),
            todayLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 22)
        ])
    }
    
    private func setupCollectionView() {
        contentView.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 6),
            collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        backgroundView?.backgroundColor = .clear
        backgroundColor = .clear
        bringSubviewToFront(collectionView)
    }
}

extension HourlyWeatherCell: TableCellFetching {
    func fetch(with viewModel: CellViewModeling) {
        guard let viewModel = viewModel as? HourlyWeatherCellViewModelProtocol else { return }
        self.viewModel = viewModel
        todayLabel.text = viewModel.title
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
    }
}

extension HourlyWeatherCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.hourlyForecastInfo.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: HourlyCollectionCell.cellId, for: indexPath)
        guard let info = viewModel?.hourlyForecastInfo[indexPath.row],
              let historyCell = cell as? HourlyCollectionCell
        else { return UICollectionViewCell() }
        historyCell.fetch(info: info)
        return cell
    }
}
