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
        super.init(endPoint: "/data/2.5/onecall", method: .get)
    }
    
    override func prepareURLComponents() -> URLComponents {
        return super.prepareURLComponents()
    }
    
    override func prepareParameters() -> [String : Any] {
        let latitutde = "lat"
        let longtitude = "lon"
        let apiKey = "appid"
        return [latitutde: "33.44",
                longtitude: "-94.04",
                apiKey: "dfb922ad45c3a804ffd35ac0a5c94587"]
    }
    
    override func prepareHeaders() -> [String : String]? {
        return nil
    }
}
