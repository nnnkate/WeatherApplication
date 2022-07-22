//
//  Response.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 20.07.22.
//

import Foundation

struct SeveralDaysWeatherResponse: Decodable {
    var list: [DayData]
}

struct SeveralDaysWeather: Decodable {
    var list = [DayData]()

    init(response: SeveralDaysWeatherResponse) {
        var dateString = ""
        for element in response.list {
            let currentDateString = element.date.prefix(11)
            if dateString != currentDateString {
                dateString = String(currentDateString)
                let mainResponse = element.main
                self.list.append(DayData(main: mainResponse, date: dateString))
            }
        }
    }
}

struct DayData: Decodable {
    var main: MainResponse
    var date: String
    
    private enum CodingKeys: String, CodingKey {
        case main
        case date = "dt_txt"
    }
}

struct CurrentWeatherResponse: Decodable {
    var coord: CoordinatesResponse
    var weather: [Weather]
    var main: MainResponse
    var name: String
    var wind: WindResponse
}

struct CoordinatesResponse: Decodable {
    var lon: Double
    var lat: Double
}

struct Weather: Decodable {
    var id: Double
    var main: String
    var description: String
    var icon: String
}

struct MainResponse: Decodable {
    var temp: Double
    var feelsLike: Double
    var tempMin: Double
    var tempMax: Double
    var pressure: Double
    var humidity: Double
    
    private enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
}

struct WindResponse: Decodable {
    var speed: Double
    var deg: Double
}

