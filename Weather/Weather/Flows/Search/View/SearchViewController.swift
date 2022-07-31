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
    
    lazy var cityWeatherTableView: UITableView = {
        let cityWeatherTableView = UITableView()
        
        cityWeatherTableView.delegate = self
        cityWeatherTableView.dataSource = self
        
        cityWeatherTableView.register(CityWeatherTableViewCell.classForCoder(),
                        forCellReuseIdentifier: CityWeatherTableViewCell.id)
        
        cityWeatherTableView.backgroundColor = .clear
    
        return cityWeatherTableView
    }()
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        addSubviews()
        configureLayout()
        
        getWeatherData() 
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
        view.addSubview(cityWeatherTableView)
    }
    
    func configureLayout() {
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.horizontalAdapted),
            searchTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        ])
        
        cityWeatherTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityWeatherTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.horizontalAdapted),
            cityWeatherTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityWeatherTableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 5.verticalAdapted),
            cityWeatherTableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7)
        ])
    }
}

// MARK: - MainViewProtocol

extension SearchViewController: SearchViewProtocol {
    func updateView(_ citiesData: [Data]) {
        cityWeatherTableView.reloadData()
    }
}

// MARK: - WeatherData

private extension SearchViewController {
    func getWeatherData() {
        let a = presenter.getWeatherInformation()
        print(a)
    }
}

