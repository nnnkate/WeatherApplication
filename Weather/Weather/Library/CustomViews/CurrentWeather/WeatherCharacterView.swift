//
//  WeatherCharacterView.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 23.07.22.
//

import Foundation
import UIKit

final class WeatherCharacterView: UIView {
    
    private var character: WeatherCharacter!
    
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
        characterStack.distribution = .fillProportionally
        characterStack.alignment = .leading
        characterStack.spacing = 2
        
        return characterStack
    }()
    
    private lazy var characterNameLabel: UILabel = {
        let characterNameLabel = UILabel()
        characterNameLabel.font = .systemFont(ofSize: CGFloat(5).adaptedFontSize())
        characterNameLabel.textColor = .customDarkPurple
        characterNameLabel.adjustsFontSizeToFitWidth = true
        characterNameLabel.minimumScaleFactor = 0.5
        
        return characterNameLabel
    }()
    
    private lazy var characterValueLabel: UILabel = {
        let characterValueLabel = UILabel()
        characterValueLabel.font = .systemFont(ofSize: CGFloat(12).adaptedFontSize())
        characterValueLabel.textColor = .customDarkPurple
        characterValueLabel.adjustsFontSizeToFitWidth = true
        characterValueLabel.minimumScaleFactor = 0.5
        characterValueLabel.textAlignment = .center
        
        return characterValueLabel
    }()
    
    // MARK: - Initialization
    
    init(character: WeatherCharacter) {
        super.init(frame: .zero)
        
        self.character = character
        
        setupApearance()
        addSubviews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func updateView(with value: Double) {
        characterValueLabel.text = String(value) + character.unit
    }
}

// MARK: - Appearance Methods

private extension WeatherCharacterView {
    private func setupApearance() {
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
            frameImage.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            frameImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            frameImage.widthAnchor.constraint(equalTo: frameImage.heightAnchor),
            frameImage.bottomAnchor.constraint(equalToSystemSpacingBelow: bottomAnchor, multiplier: -3)
        ])
        
        weatherCharacterImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherCharacterImage.leadingAnchor.constraint(equalToSystemSpacingAfter: frameImage.leadingAnchor, multiplier: 2),
            weatherCharacterImage.centerYAnchor.constraint(equalTo: frameImage.centerYAnchor),
            weatherCharacterImage.centerXAnchor.constraint(equalTo: frameImage.centerXAnchor),
            weatherCharacterImage.topAnchor.constraint(equalToSystemSpacingBelow: frameImage.topAnchor, multiplier: 2)
        ])
        
        characterStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterStack.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 0.003),
            characterStack.leadingAnchor.constraint(equalToSystemSpacingAfter: frameImage.trailingAnchor, multiplier: 1),
            characterStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            characterStack.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: 0),
            characterStack.bottomAnchor.constraint(equalToSystemSpacingBelow: bottomAnchor, multiplier: 0.003)
        ])
    }
}
