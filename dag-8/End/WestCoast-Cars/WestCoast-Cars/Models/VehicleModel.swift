//
//  VehicleModel.swift
//  WestCoast-Cars
//
//  Created by Michael Gustavsson on 2022-01-18.
//

import Foundation

struct Vehicle: Hashable {
    var registrationNumber: String
    var color: String
    var model: String
    var modelYear: Int
    var mileage: Int
    var description: String
    
    init(regNo: String, color: String, model: String, modelYear: Int, mileage: Int){
        self.registrationNumber = regNo
        self.color = color
        self.model = model
        self.modelYear = modelYear
        self.mileage = mileage
        self.description = ""
    }
}
