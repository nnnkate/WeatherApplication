//
//  SeveralDaysWeatherView.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 21.07.22.
//

import Foundation
import UIKit

final class SeveralDaysWeatherView: UIView {
    
    private var timestampsNumber: Int
    private var daysWeatherData = [DayData]() {
        didSet {
            daysWeatherDataTableView.reloadData()
        }
    }
    
    // MARK: - Views
    
    private lazy var weakDayNameLabel: UILabel = {
        let weakDayNameLabel = UILabel()
        weakDayNameLabel.font = .systemFont(ofSize: CGFloat(20).adaptedFontSize)
        weakDayNameLabel.textColor = .black
        
        weakDayNameLabel.text = "Today"
        
        return weakDayNameLabel
    }()
    
    private lazy var daysWeatherDataTableView: UITableView = {
        let daysWeatherDataTableView = UITableView()
        daysWeatherDataTableView.backgroundColor = .clear
        
        daysWeatherDataTableView.delegate = self
        daysWeatherDataTableView.dataSource = self
        
        daysWeatherDataTableView.register(DaysWeatherDataTableViewCell.classForCoder(), forCellReuseIdentifier: DaysWeatherDataTableViewCell.id)
        
        return daysWeatherDataTableView
    }()
    
    // MARK: - Initialization
    
    init(timestampsNumber: Int = 5) {
        self.timestampsNumber = timestampsNumber
        super.init(frame: .zero)
        
        setupApearance()
        addSubviews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func updateView(with data: SeveralDaysWeather) {
        daysWeatherData = data.list
    }
}

// MARK: - Appearance Methods

private extension SeveralDaysWeatherView {
    private func setupApearance() {
        self.backgroundColor = .white
        self.addShadow(color: .white)
        self.layer.cornerRadius = 13.HAdapted
        self.layer.opacity = 0.5
    }
    
    func addSubviews() {
        addSubview(daysWeatherDataTableView)
    }
    
    func configureLayout() {
        daysWeatherDataTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            daysWeatherDataTableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            daysWeatherDataTableView.centerYAnchor.constraint(equalTo: centerYAnchor),
            daysWeatherDataTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            daysWeatherDataTableView.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
}

// MARK: - UITableViewDelegate

extension SeveralDaysWeatherView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}

extension SeveralDaysWeatherView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        timestampsNumber
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let daysWeatherDataTableViewCell = daysWeatherDataTableView.dequeueReusableCell(withIdentifier: DaysWeatherDataTableViewCell.id) as? DaysWeatherDataTableViewCell else {
            return UITableViewCell()
        }

        daysWeatherDataTableViewCell.updateData(daysWeatherData.count > indexPath.row ? daysWeatherData[indexPath.row] : nil)
        
        return daysWeatherDataTableViewCell
    }
}
