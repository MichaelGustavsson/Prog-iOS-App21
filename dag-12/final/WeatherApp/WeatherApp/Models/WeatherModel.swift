//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Michael Gustavsson on 2022-01-25.
//

import Foundation

struct WeatherModel {
    // Stored properties
    let conditionId: Int
    let cityName: String
    let temperature: Double
    let feelsLike: Double
    let humidity: Int
    
    // Computed properties
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var feelsLikeString: String {
        return String(format: "%.1f", feelsLike)
    }
    
    var conditionName: String {
        switch conditionId {
            case 200...232:
            return "cloud.bolt"
            case 300...321:
                return "cloud.drizzle"
            case 500...531:
                return "cloud.rain"
            case 600...622:
                return "cloud.snow"
            case 701...781:
                return "cloud.fog"
            case 800:
                return "sun.max"
            case 801...804:
                return "cloud"
            default: return "cloud"
        }
    }
}
