//
//  ViewController.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 1.05.21.
//

import UIKit

final class MainViewController: BaseViewController {

    private struct Constants {
        static let hourlyWeatherHeight: CGFloat = 118
    }
    
    private let viewModel: MainScreenViewModelProtocol = MainScreenViewModel()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        tableView.separatorStyle = .none
        tableView.register(CurrentLocationCell.self,
                           forCellReuseIdentifier: CurrentLocationCell.identifier)
        tableView.register(CurrentWeatherCell.self,
                           forCellReuseIdentifier: CurrentWeatherCell.identifier)
        tableView.register(CurrentWeatherDetailsStackCell.self,
                           forCellReuseIdentifier: CurrentWeatherDetailsStackCell.identifier)
        tableView.register(SunsetSunriseCell.self,
                           forCellReuseIdentifier: SunsetSunriseCell.identifier)
        tableView.register(HourlyWeatherCell.self,
                           forCellReuseIdentifier: HourlyWeatherCell.identifier)
        tableView.register(WeeklyTableCell.self,
                           forCellReuseIdentifier: WeeklyTableCell.identifier)
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.updateHadler = {[weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.startUpdating { result in
            DispatchQueue.main.async {[weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}

private extension MainViewController {
    private func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModel.cellViewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: model.reusableIdentifier,
                                                 for: indexPath) as? TableCellFetching
        cell?.fetch(with: model)
        cell?.selectionStyle = .none
        (cell as? WeeklyTableCell)?.updateHandler = {[weak self] in
            self?.tableView.beginUpdates()
            self?.tableView.endUpdates()
        }
        return cell ?? UITableViewCell()
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == viewModel.cellViewModels.count - 2 {
            return Constants.hourlyWeatherHeight
        }
        return UITableView.automaticDimension
    }
}

class DynamicSizeTableView: UITableView {
    override var intrinsicContentSize: CGSize {
       self.layoutIfNeeded()
       return self.contentSize
     }

     override var contentSize: CGSize {
       didSet{
         self.invalidateIntrinsicContentSize()
       }
     }
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }
}
