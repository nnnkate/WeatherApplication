//
//  MainViewPresenter.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 19.07.22.
//

import Foundation
import UIKit
import CoreLocation
import CoreData

protocol MainViewProtocol: AnyObject {
    func updateCurrentWeather(_ data: CurrentWeatherResponse)
    func updateSeveralDaysWeather(_ data: SeveralDaysWeather)
}

protocol MainViewPresenterProtocol: AnyObject {
    func getCurrentWeather()
    func getSeveralDaysWeather()
    func getTimestampsNumber() -> Int
    func showSearchScreen()
}

class MainViewPresenter {
    
    // MARK: - Public properties
    
    weak var view: MainViewProtocol?
    
    // MARK: - Private properties
    
    private var router: RouterProtocol?
    
    private lazy var locationManager: LocationManager = {
        let locationManager = LocationManager()
        locationManager.delegate = self
        
        return locationManager
    }()
    
    // MARK: - Initialization

    required init(view: MainViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
}

// MARK: - MainViewPresenterProtocol

extension MainViewPresenter: MainViewPresenterProtocol {
    func showSearchScreen() {
        self.router?.searchViewController()
    }
    
    func getCurrentWeather() {
        guard let location = locationManager.location else { return }
        router?.networkService.getCurrentWeather(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude) { [weak self] data, error in
            guard let weatherResponse = data else { return }
            self?.view?.updateCurrentWeather(weatherResponse)
            
            if let error = error {
                print(error)
            }
        }
    }
    
    func getSeveralDaysWeather() {
        guard let location = locationManager.location else { return }
        router?.networkService.getSeveralDaysWeather(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude) { [weak self] data, error in
            guard let weatherResponse = data else { return }
            self?.view?.updateSeveralDaysWeather(weatherResponse)
            
            if let error = error {
                print(error)
            }
        }
    }
    
    func getTimestampsNumber() -> Int {
        router?.networkService.timestampsNumber ?? 0
    }
}

// MARK: - LocationManagerDelegate

extension MainViewPresenter: LocationManagerDelegate {
    func locationDidUpdate(_ location: CLLocation?) {
        getCurrentWeather()
        getSeveralDaysWeather()
    }
}
