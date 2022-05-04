//
//  WeeklyTableCell.swift
//  WeatherReport
//
//  Created by YAUHENI LEVIN on 3.05.22.
//

import UIKit.UITableView

final class WeeklyTableCell: BaseTableViewCell {
    private var viewModel: WeeklyTableCellViewModelProtocol?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.register(CurrentLocationCell.self,
                           forCellReuseIdentifier: CurrentLocationCell.identifier)
        return tableView
    }()
    
    override func setup() {
        super.setup()
    }

}


extension WeeklyTableCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.viewModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = viewModel?.reusableIdentifier ?? ""
        let dailyWeather = viewModel?.viewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        (cell as? WeeklyWeatherCell)?.fetch(with: dailyWeather)
        return cell
    }
}

extension WeeklyTableCell: TableCellFetching {
    func fetch(with viewModel: CellViewModeling) async {
        guard let viewModel = viewModel as? WeeklyTableCellViewModelProtocol,
              viewModel.viewModels.isEmpty
        else { return }
        await viewModel.updateWeeklyForecast()
        tableView.reloadData()
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
