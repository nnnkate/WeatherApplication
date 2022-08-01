//
//  SearchViewController.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 25.07.22.
//

import UIKit
import CoreData

class SearchViewController: UIViewController {
    
    var presenter: SearchViewPresenterProtocol!
    
    // MARK: - Views
    
    private lazy var searchTextField: SearchTextField = {
        let searchTextField = SearchTextField()
       
        return searchTextField
    }()
    
    lazy var cityWeatherView: CityWeatherView = {
        let cityWeatherView = CityWeatherView()
    
        return cityWeatherView
    }()
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        addSubviews()
        configureLayout()
        
        //getWeatherData()
    }
}

// MARK: - Appearance Methods

private extension SearchViewController {
    func setupAppearance() {
        view.backgroundColor = .customPurple
        navigationController?.navigationBar.tintColor = .white
    }
    
    func addSubviews() {
        view.addSubview(searchTextField)
        view.addSubview(cityWeatherView)
    }
    
    func configureLayout() {
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.horizontalAdapted),
            searchTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        ])
        
        cityWeatherView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityWeatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.horizontalAdapted),
            cityWeatherView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityWeatherView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 5.verticalAdapted),
            cityWeatherView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7)
        ])
    }
}

// MARK: - MainViewProtocol

extension SearchViewController: SearchViewProtocol {
    func updateView() {
       
    }
}

// MARK: - WeatherData

private extension SearchViewController {
    func searchCityWeatherData() {
        presenter.searchCityWeatherData()
    }
}

