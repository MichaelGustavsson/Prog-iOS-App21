//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Michael Gustavsson on 2022-01-25.
//

import Foundation

protocol WeatherServiceDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

struct WeatherService {
    // Grund url till openweathermap.org
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=bd1437c53b15df8bd7e809ef8391d83d&units=metric"
    
    // Skapa en referens till WeatherServiceDelegate...
    var delegate: WeatherServiceDelegate?
    
    func fetchWeather(city: String){
        let urlString = "\(weatherUrl)&q=\(city)"
                
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
            
            if let weather = parseJSON(weatherData: responseData){
                self.delegate?.didUpdateWeather(weather: weather)
            }
        
        }
        // Steg 4. Starta kommunikation(gör anropet)
        task.resume()
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        
        do {
            let decodedInfo = try decoder.decode(WeatherJSONMapper.self, from: weatherData)
            let name = decodedInfo.name
            let temp = decodedInfo.main.temp
            let feels_like = decodedInfo.main.feels_like
            let humidity = decodedInfo.main.humidity
            let id = decodedInfo.weather[0].id
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp, feelsLike: feels_like, humidity: humidity)
            
            return weather
        }catch {
            print(error)
            return nil
        }
    }
}
