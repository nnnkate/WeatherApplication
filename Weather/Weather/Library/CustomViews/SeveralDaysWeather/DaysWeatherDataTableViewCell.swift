//
//  DaysWeatherDataTableViewCell.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 21.07.22.
//

import UIKit

protocol TableViewCell {
    func updateData(_ data: DayData?)
}

class DaysWeatherDataTableViewCell: UITableViewCell {

    static let id = "DaysWeatherDataTableViewCell"
    
    // MARK: - Views
    
    private lazy var weakDayNameLabel: UILabel = {
        let weakDayNameLabel = UILabel()
        weakDayNameLabel.font = .systemFont(ofSize: CGFloat(20).adaptedFontSize)
        weakDayNameLabel.textColor = .black
        
        weakDayNameLabel.text = "Today"
        
        return weakDayNameLabel
    }()
    
    private lazy var weatherConditionImage: UIImageView = {
        let weatherConditionImage = UIImageView()
        weatherConditionImage.contentMode = .scaleAspectFit
        weatherConditionImage.tintColor = .black
        
        return weatherConditionImage
    }()
    
    private lazy var maxTemperatureLabel: UILabel = {
        let maxTemperatureLabel = UILabel()
        maxTemperatureLabel.font = .systemFont(ofSize: CGFloat(20).adaptedFontSize)
        maxTemperatureLabel.textColor = .black
        
        return maxTemperatureLabel
    }()
    
    private lazy var separateImage: UIImageView = {
        let separateImage = UIImageView()
        separateImage.tintColor = .black
        
        separateImage.image = UIImage(systemName: "minus")
        
        return separateImage
    }()
    
    private lazy var minTemperatureLabel: UILabel = {
        let minTemperatureLabel = UILabel()
        minTemperatureLabel.font = .systemFont(ofSize: CGFloat(20).adaptedFontSize)
        minTemperatureLabel.textColor = .black
        
        return minTemperatureLabel
    }()
    
    private let temperatureHorizontalStack: UIStackView = {
        let temperatureHorizontalStack = UIStackView()
        temperatureHorizontalStack.axis = .horizontal
        temperatureHorizontalStack.distribution = .equalSpacing
        temperatureHorizontalStack.alignment = .center
        temperatureHorizontalStack.spacing = 10
        
        return temperatureHorizontalStack
    }()
    
    private let mainHorizontalStack: UIStackView = {
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .equalCentering
        horizontalStack.alignment = .center
        horizontalStack.spacing = 10
        
        return horizontalStack
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupAppearance()
        addSubviews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - Appearance Methods

private extension DaysWeatherDataTableViewCell {
    func setupAppearance() {
        self.backgroundColor = .clear
    }
    
    func addSubviews() {
        addSubview(mainHorizontalStack)
        
        mainHorizontalStack.addArrangedSubview(weakDayNameLabel)
        mainHorizontalStack.addArrangedSubview(temperatureHorizontalStack)
        
        temperatureHorizontalStack.addArrangedSubview(weatherConditionImage)
        temperatureHorizontalStack.addArrangedSubview(minTemperatureLabel)
        temperatureHorizontalStack.addArrangedSubview(separateImage)
        temperatureHorizontalStack.addArrangedSubview(maxTemperatureLabel)
    }
    
    func configureLayout() {
        mainHorizontalStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainHorizontalStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainHorizontalStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainHorizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            mainHorizontalStack.topAnchor.constraint(equalTo: topAnchor, constant: 5)
        ])
    }
}

extension DaysWeatherDataTableViewCell: TableViewCell {
    func updateData(_ data: DayData?) {
        guard let data = data else {
            weakDayNameLabel.text = ""
            return
        }
        
        if let date = data.date.getDate() {
            weakDayNameLabel.text = DateFormatter().weekdaySymbols[Calendar.current.component(.weekday, from: date)-1]
        }
        
        guard let weatherCondition = WeatherCondition(id: data.weather.first?.id ?? 0) else { return }
        self.weatherConditionImage.image = weatherCondition.image
        
        minTemperatureLabel.text = "\(Int(data.main.tempMin))°"
        maxTemperatureLabel.text = "\(Int(data.main.tempMax))°"
    }
}
