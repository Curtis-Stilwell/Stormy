//
//  CurrentWeather.swift
//  Stormy
//
//  Created by Curtis Stilwell on 5/19/18.
//  Copyright © 2018 Curtis Stilwell. All rights reserved.
//

import Foundation

struct CurrentWeather {
    let temperature: Double
    let humidity: Double
    let precipitationProbability: Double
    let summary: String
    let icon: String
}

extension CurrentWeather {
    
    struct Key {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let preciptiationProbability = "precipProbability"
        static let summary = "summary"
        static let icon = "icon"
    }
    
    
    init?(json: [String : AnyObject]) {
        guard let tempValue = json[Key.temperature] as? Double,
        let humidityValue = json[Key.humidity] as? Double,
        let precipitationProbabilityValue = json[Key.preciptiationProbability] as? Double,
        let summaryString = json[Key.summary] as? String,
        let iconString = json[Key.icon] as? String else { return nil }
       
        self.temperature = tempValue
        self.humidity = humidityValue
        self.precipitationProbability = precipitationProbabilityValue
        self.summary = summaryString
        self.icon = iconString
        
    }
}
