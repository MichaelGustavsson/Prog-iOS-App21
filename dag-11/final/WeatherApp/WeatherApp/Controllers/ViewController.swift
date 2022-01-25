//
//  ViewController.swift
//  WeatherApp
//
//  Created by Michael Gustavsson on 2022-01-25.
//

import UIKit
                                        // Steg 1. Adopt the protocol
class ViewController: UIViewController, WeatherServiceDelegate {
    // Skapa en variabel referens till WeatherService...
    var weatherService = WeatherService()
    
    @IBOutlet var cityInput: UITextField!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Steg 3.
        //Knyter vi weatherService's delegate till vår ViewController...
        weatherService.delegate = self
    }

    @IBAction func searchWeatherForCity(_ sender: UIButton){
        
        guard let city = cityInput.text else {
            return
        }
        
        // Anropa vårt Weather Service...
        weatherService.fetchWeather(city: city)
        cityInput.text = ""
    }

    // Steg 2. Implementera funktionen som finns i protocol...
    func didUpdateWeather(weather: WeatherModel) {
        // Resultatet kommer ifrån en bakgrunds tråd!!!
        // För att uppdatera gränssnittet måste jag flytta informationen till Main thread.        
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.weatherImage.image = UIImage(systemName: weather.conditionName)
        }
        
    }
}

