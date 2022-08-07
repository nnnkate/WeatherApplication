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
    func updateView()
}

protocol SearchViewPresenterProtocol: AnyObject {
    func searchCityWeatherData()
    func getTimestampsNumber() -> Int
}

class SearchViewPresenter {
    
    // MARK: - Public properties
    
    weak var view: SearchViewProtocol?
    
    // MARK: - Private properties
    
    private var router: RouterProtocol?
    
    // MARK: - Initialization

    required init(view: SearchViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
}

// MARK: - SearchViewPresenterProtocol

extension SearchViewPresenter: SearchViewPresenterProtocol {
    func searchCityWeatherData(){
       
    }
    
    func getTimestampsNumber() -> Int {
        router?.networkService.timestampsNumber ?? 0
    }
}


    
