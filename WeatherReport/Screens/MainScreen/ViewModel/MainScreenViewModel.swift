//
//  MainScreenViewModel.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 2.05.21.
//

import Foundation
import CoreLocation

protocol MainScreenViewModelProtocol: AnyObject {
    var cellViewModels: [CellViewModeling] { get }
    var updateHadler: (() -> Void)? { get set}
    var errorHandler: ((Error?) -> Void)? { get set}
    func fetchOneCallWeather(handler: @escaping OneCallWeatherHandler)
}

final class MainScreenViewModel {
    private let locationService = CurrentLocationService()
    private var weatherService: WeatherService?
    var cellViewModels: [CellViewModeling] = []
    var updateHadler: (() -> Void)?
    var errorHandler: ((Error?) -> Void)?
}

private extension MainScreenViewModel {
    private func setupCurrentLocationViewModel(from placemark: Placemark) {
        let currentLocationViewModel = CurrentLocationViewModel(placemark: placemark)
        cellViewModels.append(currentLocationViewModel)
        updateHadler?()
    }
}

extension MainScreenViewModel: MainScreenViewModelProtocol {
    func fetchOneCallWeather(handler: @escaping OneCallWeatherHandler) {
        locationService.updateHandler = {[weak self] location, placemark in
            self?.setupCurrentLocationViewModel(from: placemark)
            self?.weatherService = WeatherService(request: OneCallRequest(location: location))
            self?.weatherService?.getOneCallWeather() { result in
                switch result {
                case .success(let weather):
                    print(weather.currentWeather)
                case .failure(let error):
                    self?.errorHandler?(error)
                }
            }
        }
    }
}
