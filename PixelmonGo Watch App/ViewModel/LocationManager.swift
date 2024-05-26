//
//  LocationManager.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 17/05/24.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let locationManager: CLLocationManager
    @Published var degrees: Double = 0
    @Published var location: CLLocationCoordinate2D?
    
    override init() {
        self.locationManager = CLLocationManager()
        super.init()

        self.locationManager.delegate = self
        self.setup()
        
    }
    
    func setup() {
        if self.locationManager.authorizationStatus != .authorizedWhenInUse {
            self.locationManager.requestWhenInUseAuthorization()
        }
        
        if CLLocationManager.headingAvailable() {
            self.locationManager.startUpdatingLocation()
            self.locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error.localizedDescription)")
    }
    
    func requestLocation() {
        locationManager.requestLocation()
    }
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        degrees = newHeading.trueHeading
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location.coordinate
    }
}
