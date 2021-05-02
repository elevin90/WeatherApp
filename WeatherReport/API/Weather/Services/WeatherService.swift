//
//  WeatherService.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 2.05.21.
//

import Foundation

typealias OneCallWeatherHandler = (Result<Bool, Error>) -> Void

class WeatherService {
    
    private let oneCallRequest: OneCallRequest
    
    init() {
        oneCallRequest = OneCallRequest()
    }
    
    func getOneCallWeather(completion: @escaping OneCallWeatherHandler) {
        guard let request = oneCallRequest.request else {
            completion(.failure(RequestError.invalidURL))
            return
        }
        let urlSession = URLSession.shared
        urlSession.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(true))
        }.resume()
    }
    
}
