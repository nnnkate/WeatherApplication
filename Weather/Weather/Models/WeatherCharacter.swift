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
            return NSLocalizedString("minTemp", comment: "")
            
        case .maxTemp:
            return NSLocalizedString("maxTemp", comment: "")
            
        case .windSpeed:
            return NSLocalizedString("windSpeed", comment: "")
            
        case .humidity:
            return NSLocalizedString("humidity", comment: "")

        }
    }
}
