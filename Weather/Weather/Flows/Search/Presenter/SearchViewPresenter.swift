//
//  SearchViewPresenter.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 25.07.22.
//

import Foundation
import UIKit
import CoreLocation
import CoreData

protocol SearchViewProtocol: AnyObject {
    func updateCityWeatherView(_ data: SearchWeatherResponse)
    func updateSeveralDaysWeather(_ data: SeveralDaysWeather)
    func changeViewsVisibility(_ searchHasBeenCompleted: Bool)
}

protocol SearchViewPresenterProtocol: AnyObject {
    func searchCityWeatherData(searchText: String)
    func getTimestampsNumber() -> Int
}

class SearchViewPresenter {
    
    // MARK: - Public properties
    
    weak var view: SearchViewProtocol?
    
    // MARK: - Private properties
    
    private var router: RouterProtocol?
    
    private var searchHasBeenCompleted = false {
        didSet {
            view?.changeViewsVisibility(searchHasBeenCompleted)
        }
    }
    
    // MARK: - Initialization

    required init(view: SearchViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
}

// MARK: - SearchViewPresenterProtocol

extension SearchViewPresenter: SearchViewPresenterProtocol {
    func searchCityWeatherData(searchText: String){
        router?.networkService.getWeatherBySearch(searchText: searchText) { [weak self] data, error in
            guard let cityWeatherData = data.0 else { return }
            self?.searchHasBeenCompleted = true
            self?.view?.updateCityWeatherView(cityWeatherData)
            
            if let error = error.0 {
                print(error)
            }
            
            guard let severalDaysWeatherData = data.1 else { return }
            self?.view?.updateSeveralDaysWeather(severalDaysWeatherData)
            
            if let error = error.1 {
                print(error)
            }
        }
    }
    
    func getTimestampsNumber() -> Int {
        router?.networkService.timestampsNumber ?? 0
    }
}


    
