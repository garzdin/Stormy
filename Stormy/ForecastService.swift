//
//  ForecastService.swift
//  Stormy
//
//  Created by Teodor on 11/02/16.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import Foundation

struct ForecastService {
    let forecastAPIKey: String
    let forecastBaseURL: URL?
    
    init(APIKey: String) {
        forecastAPIKey = APIKey
        forecastBaseURL = URL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
    }
    
    func getForecast(_ lat: Double, long: Double, completion: ((Forecast?) -> Void)) {
        if let forecastURL = URL(string: "\(lat),\(long)", relativeTo: forecastBaseURL!) {
            let networkOperation = NetworkOperation(url: forecastURL)
            networkOperation.downloadJSONFromURL {
                (JSONDictionary) in
                let forecast = Forecast(weatherDictionary: JSONDictionary)
                completion(forecast)
            }
        } else {
            print("Could not construct a valid URL")
        }
    }
}
