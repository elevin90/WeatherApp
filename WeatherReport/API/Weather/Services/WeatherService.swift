//
//  WeatherService.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 2.05.21.
//

import Foundation
import CoreLocation

typealias OneCallWeatherHandler = (Result<WeatherResponse, Error>) -> Void

class WeatherService {
    private let request: OneCallRequest
    
    init(request: OneCallRequest) {
        self.request = request
    }
    
    func getOneCallWeather(completion: @escaping OneCallWeatherHandler) {
        guard let request = request.request else {
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
