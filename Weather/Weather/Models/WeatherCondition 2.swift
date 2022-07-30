//
//  WeatherCondition.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 21.07.22.
//

import Foundation
import UIKit

enum WeatherCondition {
    case none
    case thunderstorm
    case drizzle
    case rain
    case snow
    case atmosphere
    case clear
    case clouds

    init?(id: Double) {
        switch id {
        case 200...299:
            self = .thunderstorm
            
        case 300...399:
            self = .drizzle
            
        case 500...599:
            self = .rain
            
        case 600...699:
            self = .snow
            
        case 700...799:
            self = .atmosphere
            
        case 800:
            self = .clear
            
        case 801...899:
            self = .clouds
            
        default: return nil
        }
    }
}

extension WeatherCondition {
    var image: UIImage? {
        switch self {
        case .thunderstorm:
            return UIImage(systemName: "cloud.bolt.rain")
            
        case .drizzle:
            return UIImage(systemName: "cloud.drizzle")
            
        case .rain:
            return UIImage(systemName: "cloud.heavyrain")
            
        case .snow:
            return UIImage(systemName: "cloud.snow")
            
        case .atmosphere:
            return UIImage(systemName: "cloud.fog")
            
        case .clear:
            return UIImage(systemName: "sun.max")
            
        case .clouds:
            return UIImage(systemName: "cloud")
            
        default:
            return UIImage(systemName: "sun.and.horizon")
        }
    }
}
