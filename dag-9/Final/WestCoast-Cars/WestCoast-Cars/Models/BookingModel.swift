//
//  BookingModel.swift
//  WestCoast-Cars
//
//  Created by Michael Gustavsson on 2022-01-20.
//

import Foundation

struct BookingInfo {
    var firstName: String
    var lastName: String
    var email: String
    var phone: String
    
    init(firstName: String, lastName: String, email: String, phone: String){
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
    }
}
