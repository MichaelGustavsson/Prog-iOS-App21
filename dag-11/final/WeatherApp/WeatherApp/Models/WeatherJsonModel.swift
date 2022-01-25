//
//  WeatherJsonModel.swift
//  WeatherApp
//
//  Created by Michael Gustavsson on 2022-01-25.
//

import Foundation

struct WeatherJSON: Decodable {
    let name: String
    let main: Main
}

struct Main: Decodable {
    let temp: Double
    let feels_like: Double
    let humidity: Int
}
