//
//  ViewController.swift
//  WeatherApp
//
//  Created by Michael Gustavsson on 2022-01-25.
//

import UIKit

class ViewController: UIViewController {
    
    // Skapa en variabel referens till WeatherService...
    var weatherService = WeatherService()
    
    @IBOutlet var cityInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func searchWeatherForCity(_ sender: UIButton){
        
        guard let city = cityInput.text else {
            return
        }
//        if let city = cityInput.text {
//            // Anropa vårt Weather API...
//        }
        
        print("Du söker väder status för orten: \(city)")
        
        // Anropa vårt Weather Service...
        weatherService.fetchWeather(city: city)
        cityInput.text = ""
    }

}

