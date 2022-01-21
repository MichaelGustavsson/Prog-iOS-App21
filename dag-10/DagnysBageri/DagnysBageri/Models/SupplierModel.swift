//
//  SupplierModel.swift
//  DagnysBageri
//
//  Created by Michael Gustavsson on 2022-01-21.
//

import Foundation

struct Supplier: Hashable {
    var name: String
    var customerNumber: String
    var phone: String
    var contact: String
    var email: String
    
    init(supplierName: String){
        self.name = supplierName
        self.customerNumber = "EF45678"
        self.phone = "123-456789"
        self.contact = "Bosse Bagare"
        self.email = "\(self.name)@mail.se"
    }
}
