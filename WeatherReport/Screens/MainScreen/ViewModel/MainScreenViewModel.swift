//
//  MainScreenViewModel.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 2.05.21.
//

import Foundation
import CoreLocation
import UIKit

protocol MainScreenViewModelProtocol: AnyObject {
    var cellViewModels: [CellViewModeling] { get }
    var updateHadler: (() -> Void)? { get set}
    var errorHandler: ((Error?) -> Void)? { get set}
    func startUpdating(handler: @escaping OneCallWeatherHandler)
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
    
    private func setupWeatherCellViewModel(from response: WeatherResponse) {
        let currentWeather = response.currentWeather
        let weatherCellViewModel = WeatherCellViewModelBuilder(currentWeather:
                                                                currentWeather).create()
        cellViewModels.append(weatherCellViewModel)
    }
    
    private func setupStackCellViewModel(from response: WeatherResponse) {
        let currentWeather = response.currentWeather
        let humidityItem = WeatherDetialsStackItem(viewType: .humidity,
                                                   value: currentWeather.humidity)
        let barometerItem = WeatherDetialsStackItem(viewType: .pressure,
                                                    value: currentWeather.pressure)
        let windItemItem = WeatherDetialsStackItem(viewType: .windSpeed,
                                                   value: currentWeather.windSpeed)
        cellViewModels.append(CurrentWeatherDetailsStackCellViewModel(stackItems: [humidityItem,
                                                                                   barometerItem,
                                                                                   windItemItem]))
    }
    
    private func setupSunriseSunsetViewModel(from response: WeatherResponse) {
        let weatherCellViewModel = SunViewModelBuilder(currentWeather: response.currentWeather).create()
        cellViewModels.append(weatherCellViewModel)
    }
    
    private func setupHourlyWeatherCellViewModel(from response: WeatherResponse) {
        let hourlyWeatherCellViewModel =  HourlyWeatherCellViewModel(hourlyWeather: response.hourly)
        cellViewModels.append(hourlyWeatherCellViewModel)
    }
    
    private func setupWeeklyWeatherCellViewModel() {
        guard let service = weatherService else { return }
        let weeklyCellViewModel = WeeklyTableCellViewModel(service: service)
        cellViewModels.append(weeklyCellViewModel)
    }
}

extension MainScreenViewModel: MainScreenViewModelProtocol {
    func startUpdating(handler: @escaping OneCallWeatherHandler) {
        locationService.updateHandler = {[weak self] location, placemark in
            self?.setupCurrentLocationViewModel(from: placemark)
            self?.fetchOneCallWeather(location: location, handler: handler)
        }
    }
    
    private func fetchOneCallWeather(location: Location, handler: @escaping OneCallWeatherHandler) {
        weatherService = WeatherService(location: location)
        weatherService?.getOneCallWeather() {[weak self] result in
            switch result {
            case .success(let response):
                self?.setupWeatherCellViewModel(from: response)
                self?.setupStackCellViewModel(from: response)
                self?.setupSunriseSunsetViewModel(from: response)
                self?.setupHourlyWeatherCellViewModel(from: response)
                self?.setupWeeklyWeatherCellViewModel()
                self?.updateHadler?()
            case .failure(let error):
                self?.errorHandler?(error)
            }
        }
    }
}
