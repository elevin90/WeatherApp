//
//  ViewController.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 1.05.21.
//

import UIKit

final class MainViewController: BaseViewController {

    private let viewModel: MainScreenViewModelProtocol = MainScreenViewModel()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.register(CurrentLocationCell.self,
                           forCellReuseIdentifier: CurrentLocationCell.identifier)
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
        
        viewModel.fetchOneCallWeather { result in
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
                                                 for: indexPath)
        (cell as? CurrentLocationCell)?.fetch(with: model)
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
