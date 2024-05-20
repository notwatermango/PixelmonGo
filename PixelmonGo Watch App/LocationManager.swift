//
//  LocationManager.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 17/05/24.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager: CLLocationManager
    @Published var degrees: Double = 0
    @Published var location: CLLocationCoordinate2D?
    
    override init() {
        self.manager = CLLocationManager()
        super.init()

        self.manager.delegate = self
        self.setup()
        
    }
    
    func setup() {
        if manager.authorizationStatus != .authorizedAlways {
            manager.requestAlwaysAuthorization()
        }
        manager.allowsBackgroundLocationUpdates = true
        if CLLocationManager.headingAvailable() {
            manager.startUpdatingLocation()
            manager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error.localizedDescription)")
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    func startUpdatingLocation() {
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        degrees = newHeading.trueHeading
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location.coordinate
    }
}
