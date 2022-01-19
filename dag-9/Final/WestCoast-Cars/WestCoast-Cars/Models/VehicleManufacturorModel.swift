//
//  VehicleManufacturorModel.swift
//  WestCoast-Cars
//
//  Created by Michael Gustavsson on 2022-01-13.
//

import Foundation

struct Manufacturor: Hashable {
    var name: String
    var logoImage: String
    var availableVehicles: Int
    var vehicles: [Vehicle]
    
    init(manufacturorName: String, image: String, vehicles: [Vehicle]){
        self.name = manufacturorName
        self.logoImage = image
        self.availableVehicles = vehicles.count
        self.vehicles = vehicles
    }
}
