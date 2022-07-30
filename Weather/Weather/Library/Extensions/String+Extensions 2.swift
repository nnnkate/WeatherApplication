//
//  String+Extensions.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 23.07.22.
//

import Foundation

extension String {
    func getDate(from format: String = "yyyy-MM-dd") -> Date? {
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = format
        
        return dateFormatter.date(from: self)
    }
}
