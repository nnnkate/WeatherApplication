//
//  MainViewPresenter.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 19.07.22.
//

import Foundation


protocol MainViewProtocol: AnyObject {
   
}

protocol MainViewPresenterProtocol: AnyObject {
    
}

class MainViewPresenter: MainViewPresenterProtocol {
    private let networkService: NetworkServiceProtocol
    private var router: RouterProtocol?
    weak var view: MainViewProtocol?

    required init(view: MainViewProtocol, router: RouterProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
    }
}
