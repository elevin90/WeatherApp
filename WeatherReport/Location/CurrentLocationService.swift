//
//  CurrentLocationManager.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 4.05.21.
//

import Foundation
import CoreLocation

class CurrentLocationService: NSObject, CLLocationManagerDelegate {
   
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    private var previousLocation: CLLocation?
    var updateHandler: ((Location, CLPlacemark) -> Void)?
    
    override init() {
        super.init()
        locationManager.delegate = self
        checkAuthorization()
    }
    
    func checkAuthorization() {
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
        case .denied:
            break //show Settings instruction
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first,
              isNeedToUpdate(from: location)
        else { return }
        reverseGeocode(from: location)
    }
    
    private func isNeedToUpdate(from location: CLLocation) -> Bool {
        if let previousLocation = previousLocation {
            let distance = previousLocation.distance(from: location)
            return distance > 50
        }
        return true
    }
    
    private func reverseGeocode(from location: CLLocation) {
        geocoder.reverseGeocodeLocation(location, preferredLocale: Locale.current) {[weak self] placemarks, error in
            if let placemark = placemarks?.first {
                let coordinatesLocation = Location(latitude: location.coordinate.latitude,
                                        longtitude: location.coordinate.longitude)
                self?.updateHandler?(coordinatesLocation, placemark)
                self?.previousLocation = location
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("CLLocationManager didFailWithError \(error)")
    }
}
