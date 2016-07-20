//
//  DailyWeather.swift
//  Stormy
//
//  Created by Teodor on 14/02/16.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import Foundation
import UIKit

struct DailyWeather {
    let maxTemperature: Int?
    let minTemperature: Int?
    let humidity: Int?
    let precipChance: Int?
    let summary: String?
    var icon: UIImage? = UIImage(named: "default.png")
    var largeIcon: UIImage? = UIImage(named: "default_large.png")
    var sunriseTime: String?
    var sunsetTime: String?
    var day: String?
    let dateFormatter = DateFormatter()
    
    init(dailyWeatherDict: [String: AnyObject]) {
        minTemperature = dailyWeatherDict["temperatureMin"] as? Int
        maxTemperature = dailyWeatherDict["temperatureMax"] as? Int
        if let humidityFloat = dailyWeatherDict["humidity"] as? Double{
            humidity = Int(humidityFloat * 100)
        } else {
            humidity = nil
        }
        if let precipChanceFloat = dailyWeatherDict["precipProbability"] as? Double {
            precipChance = Int(precipChanceFloat * 100)
        } else {
            precipChance = nil
        }
        summary = dailyWeatherDict["summary"] as? String
        if let iconString = dailyWeatherDict["icon"] as? String,
            let iconEnum = Icon(rawValue: iconString) {
            (icon, largeIcon) = iconEnum.toImage()
        }
        if let sunriseDate = dailyWeatherDict["sunriseTime"] as? Double {
            sunriseTime = timeStringFromUnixTime(sunriseDate)
        } else {
            sunriseTime = nil
        }
        if let sunsetDate = dailyWeatherDict["sunsetTime"] as? Double {
            sunsetTime = timeStringFromUnixTime(sunsetDate)
        } else {
            sunsetTime = nil
        }
        if let time = dailyWeatherDict["time"] as? Double {
            day = dayStringFromTime(time)
        }
    }
    
    func timeStringFromUnixTime(_ unixTime: Double) -> String {
        let date = Date(timeIntervalSinceReferenceDate: unixTime)
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: date)
    }
    
    func dayStringFromTime(_ unixTime: Double) -> String {
        let date = Date(timeIntervalSinceReferenceDate: unixTime)
        dateFormatter.locale = Locale(localeIdentifier: Locale.current().localeIdentifier)
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }
}
