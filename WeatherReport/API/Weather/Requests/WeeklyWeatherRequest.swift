//
//  WeeklyWeatherRequest.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 23.01.22.
//

import Foundation

final class WeeklyWeatherRequest: WeatherRequest, Requestable {
    private let location: Location
    
    lazy var request: URLRequest? = {
        do {
            var request = try prepareURLRequest()
            request.allHTTPHeaderFields = self.prepareHeaders()
            request.httpMethod = method.rawValue
            return request
        } catch {
            debugPrint(error.localizedDescription)
            return nil
        }
    }()
    
    init(location: Location) {
        self.location = location
        let endPoint = "/data/2.5/forecast/daily"
        super.init(endPoint: endPoint, method: .get)
    }
    
    override func prepareURLComponents() -> URLComponents {
        var baseURLComponents = super.prepareURLComponents()
        let locale = Locale.current
        baseURLComponents.queryItems = [
            URLQueryItem(name: "lat", value: location.latitudeString),
            URLQueryItem(name: "lon", value: location.longtitudeString),
            URLQueryItem(name: "cnt", value: "10"),
            URLQueryItem(name: "units", value: locale.usesMetricSystem ? "metric" : "imperial"),
            URLQueryItem(name: "lang", value: locale.languageCode),
            URLQueryItem(name: "appid", value: "dfb922ad45c3a804ffd35ac0a5c94587")
        ]
        return baseURLComponents
    }
}
