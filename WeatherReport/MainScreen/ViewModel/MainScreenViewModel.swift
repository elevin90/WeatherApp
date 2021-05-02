//
//  MainScreenViewModel.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 2.05.21.
//

import Foundation

protocol MainScreenViewModelProtocol {
    func fetchOneCallWeather(handler: @escaping OneCallWeatherHandler)
}

class MainScreenViewModel {
    private let weatherService = WeatherService()
}


extension MainScreenViewModel: MainScreenViewModelProtocol {
    func fetchOneCallWeather(handler: @escaping OneCallWeatherHandler) {
        weatherService.getOneCallWeather { result in
            switch result {
            case .success(let reponse):
                print(reponse)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
