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
}

class ModuleBuilder: ModuleBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainViewPresenter(view: view, router: router, networkService: networkService)
        view.presenter = presenter
        
        return view
    }
}
