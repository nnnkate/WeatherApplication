//
//  MainViewController.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 19.07.22.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol!
    
    // MARK: - Private properties
    
    private lazy var severalDaysWeatherViewHeight = CGFloat(presenter.getTimestampsNumber()) * 50
    
    // MARK: - Views
    
    private lazy var backgroundImageView: UIImageView = {
        let backgroundImageView = UIImageView(image: UIImage(named: "city"))
        backgroundImageView.contentMode = .scaleAspectFit
       
        return backgroundImageView
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
        weatherConditionImage.contentMode = .scaleAspectFit
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
        
        presenter.getCurrentWeather()
    }
}

// MARK: - Appearance Methods

private extension MainViewController {
    func setupAppearance() {
        view.backgroundColor = .customPurple
    }
    
    func addSubviews() {
        view.addSubview(backgroundImageView)
        
        view.addSubview(cityNameLabel)
        view.addSubview(currentDateLabel)
        view.addSubview(weatherConditionImage)
        view.addSubview(currentTemperatureLabel)
        
        view.addSubview(severalDaysWeatherView)
    }
    
    func configureLayout() {
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.HAdapted),
            cityNameLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            cityNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.VAdapted),
            cityNameLabel.heightAnchor.constraint(equalToConstant: 45.VAdapted)
        ])
        
        currentDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currentDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.HAdapted),
            currentDateLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            currentDateLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 5.VAdapted),
            currentDateLabel.heightAnchor.constraint(equalToConstant: 25.VAdapted)
        ])
        
        weatherConditionImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherConditionImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.HAdapted),
            weatherConditionImage.centerYAnchor.constraint(equalTo: currentTemperatureLabel.centerYAnchor),
            weatherConditionImage.heightAnchor.constraint(equalTo: currentTemperatureLabel.heightAnchor, multiplier: 0.9),
            weatherConditionImage.widthAnchor.constraint(equalTo: weatherConditionImage.heightAnchor)
        ])
       
        currentTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currentTemperatureLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.HAdapted),
            currentTemperatureLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            currentTemperatureLabel.topAnchor.constraint(equalTo: currentDateLabel.bottomAnchor, constant: 5.VAdapted),
            currentTemperatureLabel.heightAnchor.constraint(equalToConstant: 80.VAdapted)
        ])
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.HAdapted),
            backgroundImageView.topAnchor.constraint(equalTo: currentTemperatureLabel.bottomAnchor, constant: 5.VAdapted),
            backgroundImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
            
        severalDaysWeatherView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            severalDaysWeatherView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            severalDaysWeatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.HAdapted),
            severalDaysWeatherView.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 20.VAdapted),
            severalDaysWeatherView.heightAnchor.constraint(equalToConstant: Int(severalDaysWeatherViewHeight).VAdapted)
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

