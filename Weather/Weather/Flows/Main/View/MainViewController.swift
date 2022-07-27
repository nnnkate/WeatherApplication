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
    
    private var currentWeatherDataIsLoaded: Bool = false {
        didSet {
            if currentWeatherDataIsLoaded, severalDaysWeatherDataIsLoaded {
                spinnerView.removeFromSuperview()
            }
        }
    }
    
    private var severalDaysWeatherDataIsLoaded: Bool = false {
        didSet {
            if currentWeatherDataIsLoaded, severalDaysWeatherDataIsLoaded {
                spinnerView.removeFromSuperview()
            }
        }
    }
    
    private lazy var severalDaysWeatherViewHeight = CGFloat(presenter.getTimestampsNumber()) * 50
    
    // MARK: - Views
    
    private lazy var spinnerView: UIView = {
        let spinnerView = UIView()
        spinnerView.backgroundColor = .customPurple
        
        let spinner = UIActivityIndicatorView(style: .large)
        spinnerView.addSubview(spinner)
        
        spinner.startAnimating()
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerXAnchor.constraint(equalTo: spinnerView.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: spinnerView.centerYAnchor).isActive = true
        
        return spinnerView
    }()
    
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
        cityNameLabel.font = .systemFont(ofSize: 40, weight: .bold)
        cityNameLabel.adjustsFontSizeToFitWidth = true
        cityNameLabel.minimumScaleFactor = 0.5

        return cityNameLabel
    }()
    
    private lazy var currentDateLabel: UILabel = {
        var currentDateLabel = UILabel()
        currentDateLabel.textColor = .white
        currentDateLabel.numberOfLines = 1
        currentDateLabel.textAlignment = .left
        currentDateLabel.font = .systemFont(ofSize: 20, weight: .regular)
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
        currentTemperatureLabel.font = .systemFont(ofSize: 70, weight: .regular)
        currentTemperatureLabel.adjustsFontSizeToFitWidth = true
        currentTemperatureLabel.minimumScaleFactor = 0.5

        return currentTemperatureLabel
    }()
    
    private lazy var weatherCharactersView: WeatherCharactersView = {
        var weatherCharactersView = WeatherCharactersView()
        
        return weatherCharactersView
    }()
    
    private lazy var severalDaysWeatherView: SeveralDaysWeatherView = {
        var severalDaysWeatherView = SeveralDaysWeatherView(timestampsNumber: presenter.getTimestampsNumber())
        
        return severalDaysWeatherView
    }()
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        
        setupAppearance()
        addSubviews()
        configureLayout()
        
        getWeatherData()
    }
}

// MARK: - Appearance Methods

private extension MainViewController {
    private func setupNavigationBar() {
        let button: UIButton = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "list.dash"), for: .normal)
        button.tintColor = .white
        button.contentMode = .right
        
        let action = UIAction { [weak self] _ in self?.handleRightBarButtonItem() }
        button.addAction(action, for: .touchUpInside)
        
        let rightBarButtonItem = UIBarButtonItem(customView: button)
        
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func setupAppearance() {
        view.backgroundColor = .customPurple
    }
    
    func addSubviews() {
        view.addSubview(backgroundImageView)
        
        view.addSubview(cityNameLabel)
        view.addSubview(currentDateLabel)
        view.addSubview(weatherConditionImage)
        view.addSubview(currentTemperatureLabel)
        
        view.addSubview(weatherCharactersView)
        view.addSubview(severalDaysWeatherView)
        
        view.addSubview(spinnerView)
    }
    
    func configureLayout() {
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityNameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            cityNameLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            cityNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cityNameLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        ])
        
        currentDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currentDateLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            currentDateLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            currentDateLabel.topAnchor.constraint(equalToSystemSpacingBelow: cityNameLabel.bottomAnchor, multiplier: 0.5),
            currentDateLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.03)
        ])
        
        weatherConditionImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherConditionImage.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            weatherConditionImage.centerYAnchor.constraint(equalTo: currentTemperatureLabel.centerYAnchor),
            weatherConditionImage.heightAnchor.constraint(equalTo: currentTemperatureLabel.heightAnchor, multiplier: 0.9),
            weatherConditionImage.widthAnchor.constraint(equalTo: weatherConditionImage.heightAnchor)
        ])
       
        currentTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currentTemperatureLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            currentTemperatureLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            currentTemperatureLabel.topAnchor.constraint(equalToSystemSpacingBelow: currentDateLabel.bottomAnchor, multiplier: 0.5),
            currentTemperatureLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06)
        ])
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImageView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            backgroundImageView.topAnchor.constraint(equalToSystemSpacingBelow: currentTemperatureLabel.bottomAnchor, multiplier: 1),
            backgroundImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
        
        weatherCharactersView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherCharactersView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherCharactersView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            weatherCharactersView.topAnchor.constraint(equalToSystemSpacingBelow: backgroundImageView.bottomAnchor, multiplier: 1),
            weatherCharactersView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.16)
        ])
        
        severalDaysWeatherView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            severalDaysWeatherView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            severalDaysWeatherView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            severalDaysWeatherView.topAnchor.constraint(equalToSystemSpacingBelow: weatherCharactersView.bottomAnchor, multiplier: 1),
            severalDaysWeatherView.heightAnchor.constraint(equalToConstant: severalDaysWeatherViewHeight)
        ])
        
        spinnerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spinnerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinnerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            spinnerView.topAnchor.constraint(equalTo: view.topAnchor),
            spinnerView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}

// MARK: - MainViewProtocol

extension MainViewController: MainViewProtocol {
    func updateCurrentWeather(_ data: CurrentWeatherResponse) {
        cityNameLabel.text = data.name
        let today = NSLocalizedString("today", comment: "")
        currentDateLabel.text = "\(today), \(Date().formatted(.dateTime.month().day().hour().minute()))"
        currentTemperatureLabel.text = "\(Int(data.main.feelsLike))°"
        
        guard let weatherCondition = WeatherCondition(id: data.weather.first?.id ?? 0) else { return }
        self.weatherConditionImage.image = weatherCondition.image
        
        currentWeatherDataIsLoaded = true
    }
    
    func updateSeveralDaysWeather(_ data: SeveralDaysWeather) {
        severalDaysWeatherView.updateView(with: data)
        
        severalDaysWeatherDataIsLoaded = true
    }
}

// MARK: - Actions

private extension MainViewController {
    func handleRightBarButtonItem() {
        presenter.showSearchScreen()
    }
}

// MARK: - WeatherData

private extension MainViewController {
    func getWeatherData() {
        presenter.getCurrentWeather()
        presenter.getSeveralDaysWeather()
    }
}

