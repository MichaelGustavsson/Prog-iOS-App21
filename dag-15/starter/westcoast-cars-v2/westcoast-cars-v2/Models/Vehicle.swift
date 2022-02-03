//
//  Vehicle.swift
//  westcoast-cars-v2
//
//  Created by Michael Gustavsson on 2022-01-28.
//

import Foundation

struct Vehicle: Decodable {
    let _id: String
    let registrationNumber: String
    let model: String
    let color: String
    let modelYear: Int
    let mileage: Int
    let imageUrl: String?
    let manufacturor: Manufacturor
    
}
