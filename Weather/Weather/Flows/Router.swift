//
//  Router.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 19.07.22.
//

import Foundation
import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var builder: ModuleBuilder? { get set }
    var networkService: NetworkServiceProtocol { get }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var builder: ModuleBuilder?
    var networkService: NetworkServiceProtocol
    
    init(navigationController: UINavigationController, builder: ModuleBuilder, networkService: NetworkServiceProtocol) {
        self.navigationController = navigationController
        self.builder = builder
        self.networkService = networkService
    }
    
    func initialViewController() {
        if let navigationController = navigationController  {
            guard let mainViewController = builder?.createMainModule(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }
}


