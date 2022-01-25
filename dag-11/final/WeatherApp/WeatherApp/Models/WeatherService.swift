//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Michael Gustavsson on 2022-01-25.
//

import Foundation

struct WeatherService {
    // Grund url till openweathermap.org
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=bd1437c53b15df8bd7e809ef8391d83d&units=metric"
    
    func fetchWeather(city: String){
        let urlString = "\(weatherUrl)&q=\(city)"
        
        print(urlString)
        
        // Hur man kommunicerar med ett REST API ifrån Swift...
        // Steg 1. Skapa en korrekt URL för nätverks kommunikation.
        guard let url = URL(string: urlString) else {
            return
        }
        
        print(url)
        
        // Steg 2. Skapa en instans av URLSession klassen/struct.
        let session = URLSession(configuration: .default)
        
        // Steg 3. Skapa en uppgift/task för vår nyligen skapade instans av URLSession.
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!)
                return
            }
            
            guard let responseData = data else {
                return
            }
            
            print("Response: \(response!)")
            print("Data: \(data!)")
            
            let dataString = String(data: responseData, encoding: .utf8)
            
            print(dataString!)
        }
        
        // Steg 4. Starta kommunikation(gör anropet)
        task.resume()
    }
}
