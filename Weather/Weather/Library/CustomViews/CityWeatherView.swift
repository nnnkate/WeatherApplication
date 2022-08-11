//
//  CityWeatherView.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 30.07.22.
//

import Foundation
import UIKit

class CityWeatherView: UIView {

    // MARK: - Views
    
    private lazy var cityWeatherLayerView: UIView = {
        let cityWeatherLayerView = UIView()
        cityWeatherLayerView.backgroundColor = .clear
        cityWeatherLayerView.layer.cornerRadius = 15.verticalAdapted
        cityWeatherLayerView.layer.masksToBounds = true
        
        return cityWeatherLayerView
    }()
    
    private lazy var cityNameLabel: UILabel = {
        let cityNameLabel = UILabel()
        cityNameLabel.textColor = .white
        cityNameLabel.numberOfLines = 1
        cityNameLabel.textAlignment = .left
        cityNameLabel.font = .systemFont(ofSize: 40, weight: .bold)
        cityNameLabel.adjustsFontSizeToFitWidth = true
        cityNameLabel.minimumScaleFactor = 0.5
        
        return cityNameLabel
    }()

    private lazy var cityWeatherConditionImage: UIImageView = {
        let cityWeatherConditionImage = UIImageView()
        cityWeatherConditionImage.contentMode = .scaleAspectFit
        cityWeatherConditionImage.tintColor = .white
        
        return cityWeatherConditionImage
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.textColor = .white
        temperatureLabel.font = .systemFont(ofSize: 25, weight: .bold)
        temperatureLabel.adjustsFontSizeToFitWidth = true
        
        return temperatureLabel
    }()
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        
        setupAppearance()
        addSubviews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateData(_ data: SearchWeatherResponse) {
        guard let cityWeather = data.list.first else { return }
        cityNameLabel.text = cityWeather.name
        temperatureLabel.text = "\(Int(cityWeather.main.temp))°"
        
        guard let weatherCondition = WeatherCondition(id: cityWeather.weather.first?.id ?? 0) else { return }
        cityWeatherConditionImage.image = weatherCondition.image
    }
    
}

// MARK: - Appearance Methods

private extension CityWeatherView {
    func setupAppearance() {
        self.backgroundColor = .clear
    }
    
    func addSubviews() {
        addSubview(cityWeatherLayerView)
        cityWeatherLayerView.addSubview(cityNameLabel)
        cityWeatherLayerView.addSubview(cityWeatherConditionImage)
        cityWeatherLayerView.addSubview(temperatureLabel)
    }
    
    func configureLayout() {
        cityWeatherLayerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityWeatherLayerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cityWeatherLayerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            cityWeatherLayerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cityWeatherLayerView.topAnchor.constraint(equalTo: self.topAnchor)
        ])

        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityNameLabel.heightAnchor.constraint(equalTo: cityWeatherLayerView.heightAnchor, multiplier: 0.5),
            cityNameLabel.centerYAnchor.constraint(equalTo: cityWeatherLayerView.centerYAnchor),
            cityNameLabel.leadingAnchor.constraint(equalTo: cityWeatherLayerView.leadingAnchor, constant: 5.verticalAdapted),
            cityNameLabel.topAnchor.constraint(equalTo: cityWeatherLayerView.topAnchor, constant: 5.verticalAdapted)
        ])

        cityWeatherConditionImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityWeatherConditionImage.heightAnchor.constraint(equalTo: cityWeatherLayerView.heightAnchor, multiplier: 0.3),
            cityWeatherConditionImage.widthAnchor.constraint(equalTo: cityWeatherConditionImage.heightAnchor),
            cityWeatherConditionImage.trailingAnchor.constraint(equalTo: cityWeatherLayerView.trailingAnchor, constant: -5.verticalAdapted),
            cityWeatherConditionImage.centerYAnchor.constraint(equalTo: cityWeatherLayerView.centerYAnchor)
        ])
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            temperatureLabel.heightAnchor.constraint(equalTo: cityWeatherLayerView.heightAnchor, multiplier: 0.3),
            temperatureLabel.widthAnchor.constraint(equalTo: cityWeatherConditionImage.heightAnchor),
            temperatureLabel.leadingAnchor.constraint(equalTo: cityWeatherLayerView.leadingAnchor, constant: 5.verticalAdapted),
            temperatureLabel.centerYAnchor.constraint(equalTo: cityWeatherLayerView.centerYAnchor)
        ])
    }
}


