//
//  WeatherManager.swift
//  Clima
//
//  Created by csuftitan on 10/30/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=e51798ac01c7b989692db1dae87c67ea"
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
    
    func performRequest(urlString: String){
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?){
        if error != nil{
            print(error!)
        }
        
        if let safeData = data{
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
        
    }
}
