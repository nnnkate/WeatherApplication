//
//  LocationManager.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 19.07.22.
//

import Foundation
import CoreLocation

protocol LocationManagerDelegate: AnyObject {
    func locationDidUpdate(_ location: CLLocation?)
}

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    private lazy var manager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        
        return manager
        
    }()
    private(set) var location: CLLocation? {
        didSet {
            delegate?.locationDidUpdate(location)
        }
    }
    
    weak var delegate: LocationManagerDelegate?
    
    override init() {
        super.init()
        
        manager.requestAlwaysAuthorization()
        requestLocationOrPermission()
    }
    
    func requestLocationOrPermission() {
        if manager.authorizationStatus == .authorizedAlways || manager.authorizationStatus == .authorizedWhenInUse {
            manager.requestLocation()
            
            return
        }
        
        requestPermission()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        requestLocationOrPermission()
    }
    
    func requestPermission() {
        manager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.last
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
