//
//  WeatherService.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 2.05.21.
//

import Foundation
import CoreLocation

@frozen enum WeatherServiceError: Swift.Error {
    case wrongURL
    case invalidStatusCode
    case parsingError
}

typealias OneCallWeatherHandler = (Result<WeatherResponse, Error>) -> Void

class WeatherService {
    private let request: Requestable
    
    init(request: Requestable) {
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

    func getWeeklyWeather() async throws -> WeeklyWeatherResponse {
        guard let request = request.request else {
            throw WeatherServiceError.wrongURL
        }
        let urlSession = URLSession.shared
        let (data, response) = try await urlSession.data(for: request)
        if let response = response as? HTTPURLResponse, response.statusCode != 200 {
            throw WeatherServiceError.invalidStatusCode
        }
        do  {
            let weather = try JSONDecoder().decode(WeeklyWeatherResponse.self, from: data)
            return weather
        } catch {
            throw WeatherServiceError.parsingError
        }
    }
}
