//
//  WeatherCharactersView.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 23.07.22.
//

import Foundation
import UIKit

final class WeatherCharactersView: UIView {
    
    // MARK: - Views
    
    private lazy var minTemperatureView: WeatherCharacterView = {
        let minTemperatureView = WeatherCharacterView(character: .minTemp)
        
        return minTemperatureView
    }()
    
    private lazy var maxTemperatureView: WeatherCharacterView = {
        let maxTemperatureView = WeatherCharacterView(character: .maxTemp)
        
        return maxTemperatureView
    }()
    
    private lazy var windSpeedView: WeatherCharacterView = {
        let windSpeedView = WeatherCharacterView(character: .windSpeed)
        
        return windSpeedView
    }()
    
    private lazy var humidityView: WeatherCharacterView = {
        let humidityView = WeatherCharacterView(character: .humidity)
        
        return humidityView
    }()
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        
        setupApearance()
        addSubviews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func updateView() {
        
    }
}

// MARK: - Appearance Methods

private extension WeatherCharactersView {
    private func setupApearance() {
        self.backgroundColor = .white.withAlphaComponent(0.3)
        self.addShadow(color: .white)
        self.layer.cornerRadius = 13.HAdapted
    }
    
    func addSubviews() {
        addSubview(minTemperatureView)
        addSubview(maxTemperatureView)
        addSubview(windSpeedView)
        addSubview(humidityView)
    }
    
    func configureLayout() {
        minTemperatureView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            minTemperatureView.topAnchor.constraint(equalTo: topAnchor),
            minTemperatureView.leadingAnchor.constraint(equalTo: leadingAnchor),
            minTemperatureView.trailingAnchor.constraint(equalTo: centerXAnchor),
            minTemperatureView.bottomAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        maxTemperatureView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            maxTemperatureView.topAnchor.constraint(equalTo: topAnchor),
            maxTemperatureView.leadingAnchor.constraint(equalTo: centerXAnchor),
            maxTemperatureView.trailingAnchor.constraint(equalTo: trailingAnchor),
            maxTemperatureView.bottomAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        windSpeedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            windSpeedView.topAnchor.constraint(equalTo: centerYAnchor),
            windSpeedView.leadingAnchor.constraint(equalTo: leadingAnchor),
            windSpeedView.trailingAnchor.constraint(equalTo: centerXAnchor),
            windSpeedView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        humidityView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            humidityView.topAnchor.constraint(equalTo: centerYAnchor),
            humidityView.leadingAnchor.constraint(equalTo: centerXAnchor),
            humidityView.trailingAnchor.constraint(equalTo: trailingAnchor),
            humidityView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
