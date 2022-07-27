//
//  SearchViewController.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 25.07.22.
//

import UIKit

class SearchViewController: UIViewController {
    
    var presenter: SearchViewPresenterProtocol!
    
    // MARK: - Views
    
    private lazy var searchTextField: UITextField = {
        let searchTextField = UITextField()
        
        return searchTextField
    }()
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        addSubviews()
        configureLayout()
    }
}

// MARK: - Appearance Methods

private extension SearchViewController {
    func setupAppearance() {
        
    }
    
    func addSubviews() {
        
    }
    
    func configureLayout() {
        
    }
}

// MARK: - MainViewProtocol

extension SearchViewController: SearchViewProtocol {
    
}
