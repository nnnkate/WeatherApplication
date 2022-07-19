//
//  MainViewController.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 19.07.22.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        presenter.getData()
    }
}

extension MainViewController: MainViewProtocol {
    
}

