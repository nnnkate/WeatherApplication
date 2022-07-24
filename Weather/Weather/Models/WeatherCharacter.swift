//
//  WeatherCharacter.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 24.07.22.
//

import Foundation
import UIKit

enum WeatherCharacter: String {
    case minTemp
    case maxTemp
    case windSpeed
    case humidity
}

extension WeatherCharacter {
    var image: UIImage? {
        switch self {
        case .minTemp:
            return UIImage(systemName: "thermometer")
            
        case .maxTemp:
            return UIImage(systemName: "thermometer")
            
        case .windSpeed:
            return UIImage(systemName: "wind")
            
        case .humidity:
            return UIImage(systemName: "humidity")

        }
    }
    
    var title: String {
        switch self {
        case .minTemp:
            return "Min temp"
            
        case .maxTemp:
            return "Min temp"
            
        case .windSpeed:
            return "Wind speed"
            
        case .humidity:
            return "Humidity"

        }
    }
}
