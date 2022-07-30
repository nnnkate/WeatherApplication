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
    
}

protocol SearchViewPresenterProtocol: AnyObject {
    var cities: [City] { get }
   // func getWeatherInformation() -> [City]
}

class SearchViewPresenter {
    
    // MARK: - Public properties
    
    weak var view: SearchViewProtocol?
    private(set) var cities = [City]()
    
    // MARK: - Private properties
    
    private var router: RouterProtocol?
    
    // MARK: - Initialization

    required init(view: SearchViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        
        self.cities = getWeatherInformation()
    }
    
    func getWeatherInformation() -> [City] {
        self.router?.citiesManager.cities ?? [City]()
    }
}

// MARK: - SearchViewPresenterProtocol

extension SearchViewPresenter: SearchViewPresenterProtocol {
    
}


    
