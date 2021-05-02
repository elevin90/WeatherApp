//
//  WeatherService.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 2.05.21.
//

import Foundation

typealias OneCallWeatherHandler = (Result<WeatherResponse, Error>) -> Void

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
        urlSession.dataTask(with: request) {data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
                completion(.success(weather))
            } catch {
                debugPrint(error.localizedDescription)
                completion(.failure(error))
            }
        }.resume()
    }
}
