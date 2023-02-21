//
//  Constant.swift
//  Forecast
//
//  Created by Jake Gloschat on 2/21/23.
//

import Foundation

struct Constants {
    
    struct WeatherURL {
        static let baseURL = "https://api.weatherbit.io/v2.0/forecast/"
        static let dailyPath = "daily"
    }
    struct APIQueryKey {
        static let cityQueryKey = "city"
        static let cityQueryValue = "SaltLake,UT"
        static let mericaQueryKey = "units"
        static let mericaQuearyValue = "I"
        static let apiKeyKey = "key"
        static let apiKeyValue = "10416a5e8f0646f19a858bc1b6075048"
    }
}
