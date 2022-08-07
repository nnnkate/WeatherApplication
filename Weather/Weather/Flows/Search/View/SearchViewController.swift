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
    
    // MARK: - Private properties
    
    private lazy var severalDaysWeatherViewHeight = CGFloat(presenter.getTimestampsNumber()) * 50
    
    // MARK: - Views
    
    private lazy var searchTextField: SearchTextField = {
        let searchTextField = SearchTextField()
       
        return searchTextField
    }()
    
    lazy var cityWeatherView: CityWeatherView = {
        let cityWeatherView = CityWeatherView()
    
        return cityWeatherView
    }()
    
    private lazy var severalDaysWeatherView: SeveralDaysWeatherView = {
        var severalDaysWeatherView = SeveralDaysWeatherView(timestampsNumber: presenter.getTimestampsNumber())
        
        return severalDaysWeatherView
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
        
        view.addSubview(severalDaysWeatherView)
    }
    
    func configureLayout() {
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.horizontalAdapted),
            searchTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        ])
        
        cityWeatherView.backgroundColor = .yellow
        cityWeatherView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityWeatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.horizontalAdapted),
            cityWeatherView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityWeatherView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 5.verticalAdapted),
            cityWeatherView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
        
        severalDaysWeatherView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            severalDaysWeatherView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            severalDaysWeatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.horizontalAdapted),
            severalDaysWeatherView.topAnchor.constraint(equalTo: cityWeatherView.bottomAnchor, constant: 5.verticalAdapted),
            severalDaysWeatherView.heightAnchor.constraint(equalToConstant: severalDaysWeatherViewHeight)
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

