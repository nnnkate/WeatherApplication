//
//  WeatherCondition.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 21.07.22.
//

import Foundation

enum WeatherCondition: String {
    case none
    case thunderstorm
    case drizzle
    case rain
    case snow
    case atmosphere
    case clear
    case clouds

    init?(index: Int) {
        switch index {
        case 200...299: self = .thunderstorm
        case 300...399: self = .drizzle
        case 500...599: self = .rain
        case 600...699: self = .snow
        case 700...799: self = .atmosphere
        case 800: self = .clear
        case 801...899: self = .clouds
        default: return nil
        }
    }
}
