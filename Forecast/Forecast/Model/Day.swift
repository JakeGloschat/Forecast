//
//  Day.swift
//  Forecast
//
//  Created by Jake Gloschat on 2/21/23.
//

import Foundation

class Day {
    
    let cityName: String
    let temp: Double
    let highTemp: Double
    let lowTemp: Double
    let description: String
    let iconString: String
    let validDate: String
    
    enum Keys: String {
        case cityName = "city_name"
        case temp
        case highTemp = "high_temp"
        case lowTemp = "low_temp"
        case description
        case iconString = "icon"
        case validDate = "valid_date"
    }
    
    init?(dictionary: [String: Any], cityName: String) {
        
        guard let temp = dictionary[Keys.temp.rawValue] as? Double,
              let highTemp = dictionary[Keys.highTemp.rawValue] as? Double,
              let lowTemp = dictionary[Keys.lowTemp.rawValue] as? Double,
              let validDate = dictionary[Keys.validDate.rawValue] as? String,
              let weatherDict = dictionary["weather"] as? [String : Any],
              let description = weatherDict[Keys.description.rawValue] as? String,
              let iconString = weatherDict[Keys.iconString.rawValue] as? String else { return nil }
              
                self.cityName = cityName
                self.temp = temp
                self.highTemp = highTemp
                self.lowTemp = lowTemp
                self.description = description
                self.iconString = iconString
                self.validDate = validDate
    }
} // End of Class
