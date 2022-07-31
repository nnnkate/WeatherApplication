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
    func updateView(_ citiesData: [Data])
}

protocol SearchViewPresenterProtocol: AnyObject {
    var citiesData: [City] { get }
    func getWeatherInformation() -> [City]
}

class SearchViewPresenter {
    
    // MARK: - Public properties
    
    weak var view: SearchViewProtocol?
    private(set) var citiesData = [City]()
    
    // MARK: - Private properties
    
    private var router: RouterProtocol?
    
    // MARK: - Initialization

    required init(view: SearchViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        
        self.citiesData = getWeatherInformation()
    }
}

// MARK: - SearchViewPresenterProtocol

extension SearchViewPresenter: SearchViewPresenterProtocol {
    func getWeatherInformation() -> [City] {
        self.router?.citiesManager.getCityData() ?? [City]()
    }
}


    
