//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Michael Gustavsson on 2022-01-25.
//

import Foundation

protocol WeatherServiceDelegate {
    func didUpdateWeather(_ weatherService: WeatherService, weatherData: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherService {
    // Grund url till openweathermap.org
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=bd1437c53b15df8bd7e809ef8391d83d&units=metric"
    
    // Skapa en referens till WeatherServiceDelegate...
    var delegate: WeatherServiceDelegate?
    
    func fetchWeather(_ city: String){
        let urlString = "\(weatherUrl)&q=\(city)"
        
        guard let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        makeRequest(with: encodedString)
    }
    
    func makeRequest(with urlString: String){
        guard let url = URL(string: urlString) else {
            return
        }
        
        
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                delegate?.didFailWithError(error: error!)
                return
            }
            
            guard let responseData = data else {
                return
            }
            
            if let weather = parseJSON(responseData){
                self.delegate?.didUpdateWeather(self, weatherData: weather)
            }
        
        }
        task.resume()
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel?{
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
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
