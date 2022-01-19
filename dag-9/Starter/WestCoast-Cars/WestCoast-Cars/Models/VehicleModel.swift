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
    var image: String
    var description: String
    
    init(regNo: String, color: String, model: String, modelYear: Int, mileage: Int){
        self.registrationNumber = regNo
        self.color = color
        self.model = model
        self.modelYear = modelYear
        self.mileage = mileage
        self.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent molestie risus ut eleifend interdum. Nunc vel nulla cursus, luctus nunc elementum, suscipit nisi. Aliquam pharetra lorem eu arcu maximus scelerisque. Nulla scelerisque odio elit, a pulvinar lectus blandit ut. Morbi eget tellus massa. Etiam sed velit sed nisl pretium ornare."
        self.image = ""
    }
    
    init(regNo: String, color: String, model: String, modelYear: Int, mileage: Int, vehicleImage: String){
        self.registrationNumber = regNo
        self.color = color
        self.model = model
        self.modelYear = modelYear
        self.mileage = mileage
        self.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent molestie risus ut eleifend interdum. Nunc vel nulla cursus, luctus nunc elementum, suscipit nisi. Aliquam pharetra lorem eu arcu maximus scelerisque. Nulla scelerisque odio elit, a pulvinar lectus blandit ut. Morbi eget tellus massa. Etiam sed velit sed nisl pretium ornare."
        self.image = vehicleImage
    }
}
