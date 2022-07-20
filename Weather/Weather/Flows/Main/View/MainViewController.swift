//
//  MainViewController.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 19.07.22.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol!
    
    // MARK: - Views
    
    private lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView(image: UIImage(named: "city"))
        backgroundImage.contentMode = .scaleAspectFit
        
        return backgroundImage
    }()
    
    private lazy var cityNameLabel: UILabel = {
        var cityNameLabel = UILabel()
        cityNameLabel.textColor = .white
        cityNameLabel.numberOfLines = 0
        cityNameLabel.textAlignment = .center
        cityNameLabel.font = .systemFont(ofSize: CGFloat(40).adaptedFontSize, weight: .bold)
        cityNameLabel.adjustsFontSizeToFitWidth = true
        cityNameLabel.minimumScaleFactor = 0.5

        return cityNameLabel
    }()
    
    private lazy var currentTemperatureLabel: UILabel = {
        var currentTemperatureLabel = UILabel()
        currentTemperatureLabel.textColor = .white
        currentTemperatureLabel.numberOfLines = 0
        currentTemperatureLabel.textAlignment = .center
        currentTemperatureLabel.font = .systemFont(ofSize: CGFloat(70).adaptedFontSize, weight: .regular)
        currentTemperatureLabel.adjustsFontSizeToFitWidth = true
        currentTemperatureLabel.minimumScaleFactor = 0.5

        return currentTemperatureLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        addSubviews()
        configureLayout()
        
        presenter.getData()
    }
}

// MARK: - Appearance Methods

private extension MainViewController {
    func setupAppearance() {
        view.backgroundColor = .customPurple
    }
    
    func addSubviews() {
        view.addSubview(backgroundImage)
        
        view.addSubview(cityNameLabel)
        view.addSubview(currentTemperatureLabel)
    }
    
    func configureLayout() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.HAdapted),
            cityNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40.VAdapted),
            cityNameLabel.heightAnchor.constraint(equalTo: cityNameLabel.heightAnchor, constant: 50.VAdapted)
        ])
        
        currentTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currentTemperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentTemperatureLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.HAdapted),
            currentTemperatureLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 5.VAdapted),
            currentTemperatureLabel.heightAnchor.constraint(equalTo: currentTemperatureLabel.heightAnchor, constant: 80.VAdapted)
        ])
    }
}

// MARK: - MainViewProtocol

extension MainViewController: MainViewProtocol {
    func updateView(with data: WeatherResponse) {
        print(data) // temporary
        cityNameLabel.text = data.name
        currentTemperatureLabel.text = "\(Int(data.main.feelsLike))°"
    }
}

