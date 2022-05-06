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
    private let location: Location
    
    init(location: Location) {
        self.location = location
    }
    
    func getOneCallWeather(completion: @escaping OneCallWeatherHandler) {
        let request: Requestable = OneCallRequest(location: location)
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
        let request: Requestable = WeeklyWeatherRequest(location: location)
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
