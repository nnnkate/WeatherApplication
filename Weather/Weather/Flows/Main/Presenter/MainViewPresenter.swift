//
//  MainViewPresenter.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 19.07.22.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func updateView(with data: WeatherResponse)
}

protocol MainViewPresenterProtocol: AnyObject {
    func getCurrentWeather()
}

class MainViewPresenter {
    
    // MARK: - Public properties
    
    weak var view: MainViewProtocol?
    
    // MARK: - Private properties
    
    private var router: RouterProtocol?
    private let networkService: NetworkServiceProtocol
    
    private let locationManager = LocationManager()

    required init(view: MainViewProtocol, router: RouterProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
    }
}

// MARK: - MainViewPresenterProtocol

extension MainViewPresenter: MainViewPresenterProtocol {
    func getCurrentWeather() {
        guard let location = locationManager.location else { return }
        networkService.getCurrentWeather(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude) { [weak self] data, error in
            guard let weatherResponse = data else { return }
            self?.view?.updateView(with: weatherResponse)
            
            if let error = error {
                print(error)
            }
        }
    }
}
