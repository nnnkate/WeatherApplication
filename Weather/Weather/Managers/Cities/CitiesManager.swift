//
//  CitiesManager.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 28.07.22.
//

import Foundation

protocol CitiesManagerProtocol {
    var coreDataManager: CoreDataManager { get }
    var cities: [City] { get }
}

final class CitiesManager: CitiesManagerProtocol {
    
    private(set) lazy var coreDataManager = CoreDataManager.shared
    private(set) lazy var cities = [City]()
    
    init() {
        self.cities = self.coreDataManager.getContext()
    }
}
