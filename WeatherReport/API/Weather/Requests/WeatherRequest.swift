//
//  WeatherRequest.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 1.05.21.
//
import Foundation

enum APIMethod: String {
    case get
    case post
    case put
    case delete
}

enum RequestError: Error {
    case invalidURL
}

class WeatherRequest {
    private let baseURL = "https://api.openweathermap.org/data/2.5/"
    private let timeInterval: Double = 30
    let method: APIMethod
    let endPoint: String
    private var task: URLSessionDataTask?
    
    init(endPoint: String, method: APIMethod) {
        self.endPoint = endPoint
        self.method = method
    }
    
    func prepareURLComponents() -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.openweathermap.org"
        urlComponents.path = endPoint
        return urlComponents
    }
    
    func prepareParameters() -> [String: Any] {
        return [:]
    }
    
    func prepareHeaders() -> [String: String]? {
        return nil
    }
    
    func prepareURLRequest() throws -> URLRequest {
        let components = prepareURLComponents()
        guard let url = components.url else {
            throw  RequestError.invalidURL
        }
        return URLRequest(url: url,
                          cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                          timeoutInterval: timeInterval)
    }
}

//MARK: Prepare request components
extension WeatherRequest {
    private func queryParameters(_ parameters: [String: Any]) -> String {
        var query = ""
        parameters.forEach {key, value in
            query = "\(query)\(key)=\(value)&"
        }
        return query
    }
}
