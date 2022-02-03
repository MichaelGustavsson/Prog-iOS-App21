//
//  CreateVehicleModel.swift
//  westcoast-cars-v2
//
//  Created by Michael Gustavsson on 2022-02-01.
//

import Foundation

struct CreateVehicleModel: Codable {
    let registrationNumber: String
    let model: String
    let color: String
    let modelYear: Int
    let mileage: Int
    let gearType: String
    let fuelType: String
    let imageUrl: String?
    
    init(regNo: String, vehicleModel: String, modelYear: Int, color: String, mileage: Int, gearType: String, fuelType: String){
        self.registrationNumber = regNo
        self.model = vehicleModel
        self.modelYear = modelYear
        self.mileage = mileage
        self.gearType = gearType
        self.fuelType = fuelType
        self.color = color
        imageUrl = "https://i.postimg.cc/nVYKG8qj/no-car.png"
    }
}
