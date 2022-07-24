//
//  WeatherCharacterView.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 23.07.22.
//

import Foundation
import UIKit

final class WeatherCharacterView: UIView {
    
    // MARK: - Views
    
    private lazy var weatherCharacterImage: UIImageView = {
        let weatherCharacterImage = UIImageView()
        weatherCharacterImage.contentMode = .scaleAspectFit
        weatherCharacterImage.tintColor = .black
        
        weatherCharacterImage.image = UIImage(systemName: "thermometer")

        return weatherCharacterImage
    }()
    
    private let characterStack: UIStackView = {
        let characterStack = UIStackView()
        characterStack.axis = .vertical
        characterStack.distribution = .equalCentering
        characterStack.alignment = .center
        characterStack.spacing = 5
        
        return characterStack
    }()
    
    private lazy var characterNameLabel: UILabel = {
        let characterNameLabel = UILabel()
        characterNameLabel.font = .systemFont(ofSize: CGFloat(10).adaptedFontSize)
        characterNameLabel.textColor = .black
        
        characterNameLabel.text = "Min temp"
        
        return characterNameLabel
    }()
    
    private lazy var characterValueLabel: UILabel = {
        let characterValueLabel = UILabel()
        characterValueLabel.font = .systemFont(ofSize: CGFloat(40).adaptedFontSize)
        characterValueLabel.textColor = .black
        
        characterValueLabel.text = "20"
        
        return characterValueLabel
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

private extension WeatherCharacterView {
    private func setupApearance() {
        //self.backgroundColor = .yellow
        
    }
    
    func addSubviews() {
        addSubview(weatherCharacterImage)
        addSubview(characterStack)
        
        characterStack.addArrangedSubview(characterNameLabel)
        characterStack.addArrangedSubview(characterValueLabel)
    }
    
    func configureLayout() {
        weatherCharacterImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherCharacterImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            weatherCharacterImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherCharacterImage.heightAnchor.constraint(equalTo: weatherCharacterImage.widthAnchor),
            weatherCharacterImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        characterStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterStack.topAnchor.constraint(equalTo: topAnchor),
            characterStack.leadingAnchor.constraint(equalTo: weatherCharacterImage.trailingAnchor, constant: 5.HAdapted),
            characterStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            characterStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
