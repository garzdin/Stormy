//
//  ViewController.swift
//  Stormy
//
//  Created by Teodor on 11/02/16.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    var dailyWeather: DailyWeather? {
        didSet {
            configureView()
        }
    }
    
    @IBOutlet weak var weatherIcon: UIImageView?
    @IBOutlet weak var summaryLabel: UILabel?
    @IBOutlet weak var sunriseTimeLabel: UILabel?
    @IBOutlet weak var sunsetTimeLabel: UILabel?
    @IBOutlet weak var lowTemperatureLabel: UILabel!
    @IBOutlet weak var highTemperatureLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view, typically from a nib.
        configureView()
    }
    
    func configureView() {
        if let weather = dailyWeather {
            // Update UI with information from the data model
            weatherIcon?.image = weather.largeIcon
            summaryLabel?.text = weather.summary
            sunriseTimeLabel?.text = weather.sunriseTime
            sunsetTimeLabel?.text = weather.sunsetTime
            if let lowTemp = weather.minTemperature,
                let highTemp = weather.maxTemperature,
                let rain = weather.precipChance,
                let humidity = weather.humidity {
                lowTemperatureLabel?.text = "\(lowTemp)°"
                highTemperatureLabel?.text = "\(highTemp)°"
                precipitationLabel?.text = "\(rain)%"
                humidityLabel?.text = "\(humidity)%"
            }
            self.title = weather.day
        }
        
        // Configure nav bar back button
        if let buttonFont = UIFont(name: "HelveticaNeue-Thin", size: 20.0) {
            let barButtonAttributesDictionary: [String: AnyObject]? = [
                NSForegroundColorAttributeName: UIColor.white(),
                NSFontAttributeName: buttonFont
            ]
            UIBarButtonItem.appearance().setTitleTextAttributes(barButtonAttributesDictionary, for: UIControlState())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

