//
//  OneCallRequest.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 1.05.21.
//

import Foundation

final class  OneCallRequest: WeatherRequest {
    
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
    
    init() {
        let endPoint = "/data/2.5/onecall"
        super.init(endPoint: endPoint,
                   method: .get)
    }
    
    override func prepareURLComponents() -> URLComponents {
        var urlComponents = super.prepareURLComponents()
        urlComponents.queryItems = [
            URLQueryItem(name: "lat", value: "33.44"),
            URLQueryItem(name: "lon", value: "-94.04"),
            URLQueryItem(name: "exclude", value: "hourly,daily,minutely,hourly"),
            URLQueryItem(name: "appid", value: "dfb922ad45c3a804ffd35ac0a5c94587")
        ]
        return urlComponents
    }
    
    override func prepareParameters() -> [String : Any] {
        return super.prepareParameters()
    }
    
    override func prepareHeaders() -> [String : String]? {
        return nil
    }
}
