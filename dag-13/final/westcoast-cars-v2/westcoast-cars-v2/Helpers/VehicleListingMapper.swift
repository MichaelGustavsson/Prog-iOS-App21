//
//  VehicleListingMapper.swift
//  westcoast-cars-v2
//
//  Created by Michael Gustavsson on 2022-01-28.
//

import Foundation

struct VehicleListingMapper: Decodable {
    let success: Bool
    let count: Int
    let data: [Vehicle]
}
