//
//  WeatherCharacter.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 24.07.22.
//

import Foundation
import UIKit

enum WeatherCharacter: String {
    case temp
    case windSpeed
    case humidity
}

extension WeatherCharacter {
    var image: UIImage? {
        switch self {
        case .temp:
            return UIImage(systemName: "thermometer")
            
        case .windSpeed:
            return UIImage(systemName: "wind")
            
        case .humidity:
            return UIImage(systemName: "humidity")

        }
    }
}
