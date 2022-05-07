//
//  OneCallRequest.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 1.05.21.
//

import Foundation
import CoreLocation

protocol Requestable {
    var request: URLRequest? { get }
}

final class OneCallRequest: WeatherRequest, Requestable {
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
    
    private let location: Location
    
    init(location: Location) {
        self.location = location
        let endPoint = "/data/2.5/onecall"
        super.init(endPoint: endPoint,
                   method: .get)
    }
    
    override func prepareURLComponents() -> URLComponents {
        var urlComponents = super.prepareURLComponents()
        let locale = Locale.current
        urlComponents.queryItems = [
            URLQueryItem(name: "lat", value: location.latitudeString),
            URLQueryItem(name: "lon", value: location.longtitudeString),
            URLQueryItem(name: "exclude", value: "daily,minutely"),
            URLQueryItem(name: "units", value: locale.usesMetricSystem ? "metric" : "imperial"),
            URLQueryItem(name: "lang", value: locale.languageCode),
            URLQueryItem(name: "cnt", value: "3"),
            URLQueryItem(name: "appid", value: "dfb922ad45c3a804ffd35ac0a5c94587")
        ]
        return urlComponents
    }
}
