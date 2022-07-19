//
//  NetworkService.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 19.07.22.
//

import Foundation

struct WeatherResponse: Decodable {
    let list: [Weather]
}

struct Weather: Decodable {
    let name: String
}

protocol NetworkServiceProtocol {
    func getData(completion: @escaping ([Weather]?, Error?) -> ())
}

class NetworkService {
    
    /*
     "https://api.openweathermap.org/data/2.5/find?q=\(searchBarText)&units=metric&type=like&APPID=a81356acdbd6b40ea93e32b38254aad2"
    */
    
    private let weatherDataUrlString = "https://api.openweathermap.org/data/2.5/find?q=Minsk&units=metric&type=like&APPID=a81356acdbd6b40ea93e32b38254aad2"
    
    private func fetchData(completion: @escaping (Data?, Error?) -> ()) {
        guard let url = URL(string: weatherDataUrlString) else {
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
    func getData(completion: @escaping ([Weather]?, Error?) -> ()) {
        fetchData() { data, error in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
                completion(weatherResponse.list, nil)
            }
            catch let error {
                completion(nil, error)
            }
        }
    }
}
