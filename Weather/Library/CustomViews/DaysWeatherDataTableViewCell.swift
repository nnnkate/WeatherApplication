//
//  DaysWeatherDataTableViewCell.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 21.07.22.
//

import UIKit

protocol TableViewCell {
    //func updateData(_ data: DayData?)
    func updateData(_ data: String?)
}

class DaysWeatherDataTableViewCell: UITableViewCell {

    static let id = "DaysWeatherDataTableViewCell"
    
    var weakDayNameLabel: UILabel = {
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
        
        weatherConditionImage.image = UIImage(systemName: "sun.min")
        
        return weatherConditionImage
    }()
    
    var temperatureLabel: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.font = .systemFont(ofSize: CGFloat(20).adaptedFontSize)
        temperatureLabel.textColor = .black
        
        temperatureLabel.text = "11°"
        
        return temperatureLabel
    }()
    
    private let horizontalStack: UIStackView = {
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        horizontalStack.alignment = .center
        horizontalStack.spacing = 10
        
        return horizontalStack
    }()
    
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
        addSubview(horizontalStack)
        
        horizontalStack.addArrangedSubview(weakDayNameLabel)
        horizontalStack.addArrangedSubview(weatherConditionImage)
        horizontalStack.addArrangedSubview(temperatureLabel)
    }
    
    func configureLayout() {
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            horizontalStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            horizontalStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            horizontalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            horizontalStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 5)
        ])
    }
}

extension DaysWeatherDataTableViewCell: TableViewCell {
    //func updateData(_ data: DayData?) {
    func updateData(_ data: String?) {
        print("update")
        guard let data = data else {
            weakDayNameLabel.text = ""
            return
            
        }
       // weakDayNameLabel.text = data.date
        weakDayNameLabel.text = data
    }
}
