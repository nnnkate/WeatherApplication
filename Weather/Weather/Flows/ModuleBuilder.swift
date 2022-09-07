//
//  ModuleBuilder.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 19.07.22.
//

import Foundation
import UIKit

protocol ModuleBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createSearchModule(router: RouterProtocol) -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let presenter = MainViewPresenter(view: view, router: router)
        view.presenter = presenter
        
        return view
    }
    
    func createSearchModule(router: RouterProtocol) -> UIViewController {
        let view = SearchViewController()
        let presenter = SearchViewPresenter(view: view, router: router)
        view.presenter = presenter

        return view
    }
}
