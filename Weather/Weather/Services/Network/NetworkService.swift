//
//  NetworkService.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 19.07.22.
//

import Foundation
import CoreLocation

protocol NetworkServiceProtocol {
    var timestampsNumber: Int { get }
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees, completion: @escaping (CurrentWeatherResponse?, Error?) -> ())
    func getSeveralDaysWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees, completion: @escaping (SeveralDaysWeather?, Error?) -> ())
}

class NetworkService {
    
    // MARK: - Private properties
    
    private(set) var timestampsNumber: Int = 5
    
    private let appID = "a81356acdbd6b40ea93e32b38254aad2"
    
    // searchText
    //private var searchText = "Minsk" // temporary
    //private let weatherDataUrlString = "https://api.openweathermap.org/data/2.5/find?q=\(searchText)&units=metric&type=like&APPID=\(appID)" // temporary
    
   private func fetchData(urlString: String, completion: @escaping (Data?, Error?) -> ()) {
        guard let url = URL(string: urlString) else {
            let error = NSError(domain: NSURLErrorDomain, code: NSURLErrorBadURL)
            completion(nil, error)
            return
        }

        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        let session = URLSession(configuration: .default)

        let dataTask = session.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(nil, error)
                    return
                }
                guard let data = data else { return }
                completion(data, nil)
            }
        }
        dataTask.resume()
    }
}

// MARK: - API

extension NetworkService: NetworkServiceProtocol {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees, completion: @escaping (CurrentWeatherResponse?, Error?) -> ()) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(appID)&units=metric"
        fetchData(urlString: urlString) { data, error in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let weatherResponse = try decoder.decode(CurrentWeatherResponse.self, from: data)
                completion(weatherResponse, nil)
            }
            catch let error {
                completion(nil, error)
            }
        }        
    }
    
    func getSeveralDaysWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees, completion: @escaping (SeveralDaysWeather?, Error?) -> ()) {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=\(appID)&units=metric"
        fetchData(urlString: urlString) { data, error in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let severalDaysWeatherResponse = try decoder.decode(SeveralDaysWeatherResponse.self, from: data)
                let severalDaysWeather = SeveralDaysWeather(response: severalDaysWeatherResponse)
                completion(severalDaysWeather, nil)
            }
            catch let error {
                completion(nil, error)
            }
        }
    }
}

