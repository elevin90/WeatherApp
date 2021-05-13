//
//  MainScreenViewModel.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 2.05.21.
//

import Foundation
import CoreLocation

protocol MainScreenViewModelProtocol {
    func fetchOneCallWeather(handler: @escaping OneCallWeatherHandler)
}

final class MainScreenViewModel {
    private let locationService = CurrentLocationService()
    private var weatherService: WeatherService?
}

private extension MainScreenViewModel {
    private func setupCityFromPlacemark(_ placemark: CLPlacemark) {
        
    }
}

extension MainScreenViewModel: MainScreenViewModelProtocol {
    func fetchOneCallWeather(handler: @escaping OneCallWeatherHandler) {
        locationService.updateHandler = {[weak self] location, placemark in
            self?.weatherService = WeatherService(request: OneCallRequest(location: location))
            self?.weatherService?.getOneCallWeather() { result in
                switch result {
                case .success(let weather):
                    print(weather.currentWeather)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
