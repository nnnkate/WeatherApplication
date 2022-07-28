//
//  Router.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 19.07.22.
//

import Foundation
import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get }
    var builder: ModuleBuilder? { get }
    var networkService: NetworkServiceProtocol { get }
    var coreDataManager: CoreDataManager { get }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func searchViewController()
}

class Router: RouterProtocol {
    private(set) var navigationController: UINavigationController?
    private(set) var builder: ModuleBuilder?
    private(set) var networkService: NetworkServiceProtocol
    private(set) var coreDataManager: CoreDataManager
    
    init(navigationController: UINavigationController, builder: ModuleBuilder, networkService: NetworkServiceProtocol, coreDataManager: CoreDataManager) {
        self.navigationController = navigationController
        self.builder = builder
        self.networkService = networkService
        self.coreDataManager = coreDataManager
    }
    
    func initialViewController() {
        if let navigationController = navigationController  {
            guard let mainViewController = builder?.createMainModule(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func searchViewController() {
        if let navigationController = navigationController  {
            guard let searchViewController = builder?.createSearchModule(router: self) else { return }
            navigationController.pushViewController(searchViewController, animated: true)
        }
    }
}


