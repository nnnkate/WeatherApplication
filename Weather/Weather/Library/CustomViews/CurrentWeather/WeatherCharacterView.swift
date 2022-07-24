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
    
    private lazy var frameImage: UIImageView = {
        let frameImage = UIImageView()
        frameImage.contentMode = .scaleAspectFit
        frameImage.tintColor = .customDarkPurple
        
        frameImage.image = UIImage(systemName: "circle")

        return frameImage
    }()
    
    private lazy var weatherCharacterImage: UIImageView = {
        let weatherCharacterImage = UIImageView()
        weatherCharacterImage.contentMode = .scaleAspectFit
        weatherCharacterImage.tintColor = .customDarkPurple

        return weatherCharacterImage
    }()
    
    private let characterStack: UIStackView = {
        let characterStack = UIStackView()
        characterStack.axis = .vertical
        characterStack.distribution = .equalCentering
        characterStack.alignment = .center
        characterStack.spacing = 2.VAdapted
        
        return characterStack
    }()
    
    private lazy var characterNameLabel: UILabel = {
        let characterNameLabel = UILabel()
        characterNameLabel.font = .systemFont(ofSize: CGFloat(15).adaptedFontSize)
        characterNameLabel.textColor = .customDarkPurple
        
        return characterNameLabel
    }()
    
    private lazy var characterValueLabel: UILabel = {
        let characterValueLabel = UILabel()
        characterValueLabel.font = .systemFont(ofSize: CGFloat(35).adaptedFontSize)
        characterValueLabel.textColor = .customDarkPurple
        
        characterValueLabel.text = "20"
        
        return characterValueLabel
    }()
    
    // MARK: - Initialization
    
    init(character: WeatherCharacter) {
        super.init(frame: .zero)
        
        setupApearance(character: character)
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
    private func setupApearance(character: WeatherCharacter) {
        weatherCharacterImage.image = character.image
        characterNameLabel.text = character.title
    }
    
    func addSubviews() {
        addSubview(frameImage)
        addSubview(weatherCharacterImage)
        addSubview(characterStack)
        
        characterStack.addArrangedSubview(characterNameLabel)
        characterStack.addArrangedSubview(characterValueLabel)
    }
    
    func configureLayout() {
        frameImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            frameImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5.HAdapted),
            frameImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            frameImage.trailingAnchor.constraint(equalTo: centerXAnchor),
            frameImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5.VAdapted)
        ])
        
        weatherCharacterImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherCharacterImage.leadingAnchor.constraint(equalTo: frameImage.leadingAnchor, constant: 15.HAdapted),
            weatherCharacterImage.centerYAnchor.constraint(equalTo: frameImage.centerYAnchor),
            weatherCharacterImage.centerXAnchor.constraint(equalTo: frameImage.centerXAnchor),
            weatherCharacterImage.bottomAnchor.constraint(equalTo: frameImage.bottomAnchor, constant: -15.HAdapted)
        ])
        
        characterStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterStack.topAnchor.constraint(equalTo: topAnchor, constant: 5.VAdapted),
            characterStack.leadingAnchor.constraint(equalTo: weatherCharacterImage.trailingAnchor, constant: 2.HAdapted),
            characterStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5.HAdapted),
            characterStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5.VAdapted)
        ])
    }
}
