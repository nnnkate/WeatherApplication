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
        cityNameLabel.numberOfLines = 1
        cityNameLabel.textAlignment = .left
        cityNameLabel.font = .systemFont(ofSize: CGFloat(40).adaptedFontSize, weight: .bold)
        cityNameLabel.adjustsFontSizeToFitWidth = true
        cityNameLabel.minimumScaleFactor = 0.5

        return cityNameLabel
    }()
    
    private lazy var currentDateLabel: UILabel = {
        var currentDateLabel = UILabel()
        currentDateLabel.textColor = .white
        currentDateLabel.numberOfLines = 1
        currentDateLabel.textAlignment = .left
        currentDateLabel.font = .systemFont(ofSize: CGFloat(20).adaptedFontSize, weight: .regular)
        currentDateLabel.adjustsFontSizeToFitWidth = true
        currentDateLabel.minimumScaleFactor = 0.5

        return currentDateLabel
    }()
    
    private lazy var weatherConditionImage: UIImageView = {
        let weatherConditionImage = UIImageView()
        weatherConditionImage.contentMode = .scaleAspectFill
        weatherConditionImage.tintColor = .white
        
        return weatherConditionImage
    }()
    
    private lazy var currentTemperatureLabel: UILabel = {
        var currentTemperatureLabel = UILabel()
        currentTemperatureLabel.textColor = .white
        currentTemperatureLabel.numberOfLines = 1
        currentTemperatureLabel.textAlignment = .right
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
        
        presenter.getCurrentWeather()
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
        view.addSubview(currentDateLabel)
        view.addSubview(weatherConditionImage)
        view.addSubview(currentTemperatureLabel)
    }
    
    func configureLayout() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.HAdapted),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.HAdapted),
            cityNameLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            cityNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.VAdapted),
            cityNameLabel.heightAnchor.constraint(equalTo: cityNameLabel.heightAnchor, constant: 50.VAdapted)
        ])
        
        currentDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currentDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.HAdapted),
            currentDateLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            currentDateLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 5.VAdapted),
            currentDateLabel.heightAnchor.constraint(equalTo: cityNameLabel.heightAnchor, constant: 10.VAdapted)
        ])
        
        weatherConditionImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherConditionImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.HAdapted),
            weatherConditionImage.centerYAnchor.constraint(equalTo: currentTemperatureLabel.centerYAnchor, constant: 5.VAdapted),
            weatherConditionImage.heightAnchor.constraint(equalTo: currentTemperatureLabel.heightAnchor, multiplier: 0.7),
            weatherConditionImage.widthAnchor.constraint(equalTo: weatherConditionImage.heightAnchor)
        ])
        
        currentTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currentTemperatureLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.HAdapted),
            currentTemperatureLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            currentTemperatureLabel.topAnchor.constraint(equalTo: currentDateLabel.bottomAnchor, constant: 5.VAdapted),
            currentTemperatureLabel.heightAnchor.constraint(equalTo: currentTemperatureLabel.heightAnchor, constant: 80.VAdapted)
        ])
    }
}

// MARK: - MainViewProtocol

extension MainViewController: MainViewProtocol {
    func updateView(with data: WeatherResponse) {
        print(data) // temporary
        cityNameLabel.text = data.name
        currentDateLabel.text = "Today, \(Date().formatted(.dateTime.month().day().hour().minute()))"
        currentTemperatureLabel.text = "\(Int(data.main.feelsLike))°"
        
        guard let weatherCondition = WeatherCondition(id: data.weather.first?.id ?? 0) else { return }
        self.weatherConditionImage.image = weatherCondition.image
    }
}

