//
//  SearchViewController+TableView.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 30.07.22.
//

import Foundation
import UIKit

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        350.verticalAdapted
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cityWeatherTableViewCell = cityWeatherTableView.dequeueReusableCell(withIdentifier: CityWeatherTableViewCell.id) as? CityWeatherTableViewCell else {
            return UITableViewCell()
        }

//        let file = manager.filesData[indexPath.row]
//        filesTableViewCell.updateData(file: file, selected: manager.selectedFiles.contains(file))
//
//        filesTableViewCell.selectionStyle = .none
        
        return cityWeatherTableViewCell
    }
}
