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
    
    func updateView() {
        
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
            daysWeatherDataTableView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            daysWeatherDataTableView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            daysWeatherDataTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            daysWeatherDataTableView.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
}

// MARK: - UITableViewDelegate

extension SeveralDaysWeatherView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension SeveralDaysWeatherView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        timestampsNumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let daysWeatherDataTableViewCell = daysWeatherDataTableView.dequeueReusableCell(withIdentifier: DaysWeatherDataTableViewCell.id) as? DaysWeatherDataTableViewCell else {
            return UITableViewCell()
        }

//        let file = manager.filesData[indexPath.row]
//        filesTableViewCell.updateData(file: file, selected: manager.selectedFiles.contains(file))
//
//        filesTableViewCell.selectionStyle = .none

        return daysWeatherDataTableViewCell
    }
}
