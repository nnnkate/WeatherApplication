//
//  CityWeatherTableViewCell.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 30.07.22.
//

import Foundation
import UIKit

class CityWeatherTableViewCell: UITableViewCell {

    static let id = "CityWeatherTableViewCell"
    
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
        
        cityWeatherConditionImage.image = UIImage(systemName: "cloud")
        
        return cityWeatherConditionImage
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //

    private func configureCell() {
        setupAppearance()
        addSubviews()
        configureLayout()
    }
    
    func updateData(_ data: City) {
        cityNameLabel.text = data.name
    }
    
}

// MARK: - Appearance Methods

private extension CityWeatherTableViewCell {
    func setupAppearance() {
        self.backgroundColor = .clear
    }
    
    func addSubviews() {
        addSubview(cityWeatherLayerView)
        cityWeatherLayerView.addSubview(cityNameLabel)
        cityWeatherLayerView.addSubview(cityWeatherConditionImage)
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
            cityWeatherConditionImage.heightAnchor.constraint(equalTo: cityWeatherLayerView.heightAnchor, multiplier: 0.5),
            cityWeatherConditionImage.widthAnchor.constraint(equalTo: cityWeatherConditionImage.heightAnchor),
            cityWeatherConditionImage.trailingAnchor.constraint(equalTo: cityWeatherLayerView.trailingAnchor, constant: -5.verticalAdapted),
            cityWeatherConditionImage.topAnchor.constraint(equalTo: cityWeatherLayerView.topAnchor, constant: 5.verticalAdapted)
        ])
    }
}


