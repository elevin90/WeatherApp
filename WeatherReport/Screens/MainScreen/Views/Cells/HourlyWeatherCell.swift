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
        layout.estimatedItemSize = CGSize(width: 1, height: 1)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = DynamicHeightCollectionView(frame: .zero,
                                              collectionViewLayout: collectionLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let currentSize = bounds.size
//        guard currentSize != oldSize else {
//            return
//        }
//        oldSize = currentSize
        collectionLayout.invalidateLayout()
        collectionView.layoutIfNeeded()
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
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 6),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 80),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
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

//extension HourlyWeatherCell: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 140, height: 142)
//    }
//}
