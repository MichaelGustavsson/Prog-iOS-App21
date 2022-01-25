//
//  WeatherJsonModel.swift
//  WeatherApp
//
//  Created by Michael Gustavsson on 2022-01-25.
//

import Foundation

struct WeatherJSONMapper: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
    let feels_like: Double
    let humidity: Int
}

struct Weather: Decodable {
    let id: Int
    let description: String
}
