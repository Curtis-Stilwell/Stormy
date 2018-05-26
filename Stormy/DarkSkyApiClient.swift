//
//  DarkSkyApiClient.swift
//  Stormy
//
//  Created by Curtis Stilwell on 5/22/18.
//  Copyright © 2018 Curtis Stilwell. All rights reserved.
//

import Foundation

class DarkSkyAPIClient {
    fileprivate let apiKey = "5a8456c09a4d2ad15f1ca5028b6752ba"
    
    lazy var baseUrl: URL = {
         return URL(string: "https://api.darksky.net/forecast/\(self.apiKey)/")!
    }()
    
    let downloader = JSONDownloader()
    
    typealias CurrentWeatherTypeHandler = (CurrentWeather?, DarkSkyError?) -> Void
    
    func getCurrentWeather(at coordinate: Coordinate, completionHandler completion: @escaping CurrentWeatherTypeHandler) {
        
        guard let url = URL(string: coordinate.description, relativeTo: baseUrl) else {
            completion(nil, .invalidUrl)
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = downloader.jsonTask(with: request) { (json, error) in
            
            DispatchQueue.main.async {
                guard let json = json else {
                    completion(nil, error)
                    return
                }
                
                guard let currentWeatherJson = json["currently"] as? [String : AnyObject], let currentWeather = CurrentWeather(json: currentWeatherJson) else {
                    completion(nil, .jsonParsingFailure)
                    return
                }
                
                completion(currentWeather, nil)
              }
            }
            
        task.resume()
    }
}
