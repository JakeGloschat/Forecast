//
//  DayController.swift
//  Forecast
//
//  Created by Jake Gloschat on 2/21/23.
//

import Foundation

class DayController {
    
    static func fetchDays( completion: @escaping ([Day]?) -> Void) {
        
        //https://api.weatherbit.io/v2.0/forecast/daily?city=SaltLake,UT&units=I&key=10416a5e8f0646f19a858bc1b6075048
        // MARK: - Construct URL
        guard let baseURL = URL(string: Constants.WeatherURL.baseURL) else { completion(nil) ; return }
        var urlCompoenets = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlCompoenets?.path.append(Constants.WeatherURL.dailyPath)
        
        let apiQuery = URLQueryItem(name: Constants.APIQueryKey.apiKeyKey, value: Constants.APIQueryKey.apiKeyValue)
        let cityQuery = URLQueryItem(name: Constants.APIQueryKey.cityQueryKey, value: Constants.APIQueryKey.cityQueryValue)
        let unitQuery = URLQueryItem(name: Constants.APIQueryKey.mericaQueryKey, value: Constants.APIQueryKey.mericaQuearyValue)
        
        urlCompoenets?.queryItems = [cityQuery, unitQuery, apiQuery]
        
        guard let finalURL = urlCompoenets?.url else { completion (nil) ; return }
        print("FinalURL: \(finalURL)")
        
        // MARK: - DataTask
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil) ; return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response code: \(response.statusCode)")
            }
            
            guard let data = data else { completion(nil) ; return }
            
            do {
                if let topLevel = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String : Any], let dayArray = topLevel["data"] as? [[String : Any ]] {
                    
                    let day = dayArray.compactMap { Day(dictionary: $0, cityName: Constants.APIQueryKey.cityQueryValue)}
                    completion(day)
                }
            } catch {
                print("Error in Do/Try/Catch: \(error.localizedDescription)")
                completion(nil)
                return
            }
        }.resume()
    }
    
} // End of Class
