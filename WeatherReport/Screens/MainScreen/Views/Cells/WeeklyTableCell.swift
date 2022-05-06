//
//  WeeklyTableCell.swift
//  WeatherReport
//
//  Created by YAUHENI LEVIN on 3.05.22.
//

import UIKit.UITableView

final class WeeklyTableCell: BaseTableViewCell {
    private var viewModel: WeeklyTableCellViewModelProtocol?
    var updateHandler: (() -> Void)?
    private lazy var tableView: UITableView = {
        let tableView = DynamicSizeTableView()
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 120
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.register(WeeklyWeatherCell.self,
                           forCellReuseIdentifier: WeeklyWeatherCell.identifier)
        return tableView
    }()
    
    override func setup() {
        super.setup()
        addSubview(tableView)
        backgroundColor = .clear
        backgroundView?.backgroundColor = .clear
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}


extension WeeklyTableCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.viewModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = WeeklyWeatherCell.identifier
        let dailyWeather = viewModel?.viewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        (cell as? WeeklyWeatherCell)?.fetch(with: dailyWeather)
        return cell
    }
}

extension WeeklyTableCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension WeeklyTableCell: TableCellFetching {
    func fetch(with viewModel: CellViewModeling) {
        guard let viewModel = viewModel as? WeeklyTableCellViewModelProtocol,
              viewModel.viewModels.isEmpty
        else { return }
        self.viewModel = viewModel
        Task {
            await viewModel.updateWeeklyForecast()
            tableView.reloadData()
            self.updateHandler?()
        }
    }
}

struct DailyWeatherInfo {
    let day: String
    let dailyTemperature: Float
    let nightTemperature: Float
    let imageTitle: String
    
    init(dailyWeather: DailyWeather) {
        day = "Day"
        dailyTemperature = dailyWeather.temperature.dayTemperature
        nightTemperature = dailyWeather.temperature.nightTemperature
        imageTitle = ""
    }
}

protocol WeeklyTableCellViewModelProtocol: CellViewModeling {
    func updateWeeklyForecast() async
    var viewModels: [DailyWeatherInfo] { get }
}

final class WeeklyTableCellViewModel: WeeklyTableCellViewModelProtocol {
    private let service: WeatherService
    let reusableIdentifier = WeeklyTableCell.identifier
    var viewModels = [DailyWeatherInfo]()
    
    init(service: WeatherService) {
        self.service = service
    }
    
    func updateWeeklyForecast() async {
        do {
            let weeklyWeather = try await service.getWeeklyWeather()
            viewModels = weeklyWeather.list.lazy.map{DailyWeatherInfo(dailyWeather: $0)}
        }
        catch {
            switch error as? WeatherServiceError {
            case .parsingError:
                break
            case .invalidStatusCode:
                break
            case .wrongURL:
                break
            case .none:
                break
            }
        }
    }
}
