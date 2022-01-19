//
//  VehicleDiffableDataSource.swift
//  WestCoast-Cars
//
//  Created by Michael Gustavsson on 2022-01-18.
//

import UIKit

class VehicleDiffableDataSource: UITableViewDiffableDataSource<Section, Vehicle> {
    // Behövs för att kunna aktivera swipe...
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
