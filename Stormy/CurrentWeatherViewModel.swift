//
//  CurrentWeatherViewModel.swift
//  Stormy
//
//  Created by Curtis Stilwell on 5/19/18.
//  Copyright © 2018 Curtis Stilwell. All rights reserved.
//

import Foundation
import UIKit


struct CurrentWeatherViewModel {
    let temperature: String
    let humidity: String
    let precipitationProbability: String
    let summary: String
    let icon: UIImage
    
    init(model: CurrentWeather) {
       let roundedTemperature = Int(model.temperature)
       self.temperature = "\(roundedTemperature)"
      
       let humidityPercentValue = Int(model.humidity * 100)
       self.humidity = "\(humidityPercentValue)"
    
       let percipPercentValue = Int(model.precipitationProbability * 100)
       self.precipitationProbability = "\(percipPercentValue)"
        
       self.summary = model.summary
        
       let weatherIcon = WeatherIcon(iconString: model.icon)
       self.icon = weatherIcon.image
    }
}
