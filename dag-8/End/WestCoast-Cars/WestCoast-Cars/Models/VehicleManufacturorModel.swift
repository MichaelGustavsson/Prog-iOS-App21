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

    //Default Initiering med hjälp av en Initializer...
    init(){
        self.name = ""
        self.logoImage = ""
        self.availableVehicles = 0
    }
    
    init(manufacturorName: String, image: String){
        self.name = manufacturorName
        self.logoImage = image
        self.availableVehicles = 0
    }
    
    init(manufacturorName: String, image: String, numberOfVehiclesInStock: Int){
        self.name = manufacturorName
        self.logoImage = image
        self.availableVehicles = numberOfVehiclesInStock
    }
}
