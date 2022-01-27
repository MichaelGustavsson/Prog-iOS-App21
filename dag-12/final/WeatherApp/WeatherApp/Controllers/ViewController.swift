//
//  ViewController.swift
//  WeatherApp
//
//  Created by Michael Gustavsson on 2022-01-25.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    var weatherService = WeatherService()
    
    //MARK: - IBOutlets
    @IBOutlet var cityInput: UITextField!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityInput.delegate = self
        weatherService.delegate = self
    }
}

//MARK: - UITextFieldDelegate


extension ViewController: UITextFieldDelegate {
    @IBAction func searchWeatherForCity(_ sender: UIButton){
        cityInput.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cityInput.endEditing(true)
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = cityInput.text {
            weatherService.fetchWeather(city)
        }
        
        cityInput.text = ""
        cityInput.placeholder = "Sök på ort!"
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if cityInput.text != "" {
            return true
        }else {
            cityInput.placeholder = "Du måste ange ort!"
            return false
        }
    }
}

//MARK: - WeatherServiceDelegate

extension ViewController: WeatherServiceDelegate {
    func didUpdateWeather(_ weatherService: WeatherService, weatherData weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.weatherImage.image = UIImage(systemName: weather.conditionName)
            self.feelsLikeLabel.text = "Känns som \(weather.feelsLikeString) C"
            self.humidityLabel.text = "Luftfuktighet \(weather.humidity)%"
        }
        
    }
    
    func didFailWithError(error: Error) {
        print("Error caught in ViewController \(error)")
    }
}
