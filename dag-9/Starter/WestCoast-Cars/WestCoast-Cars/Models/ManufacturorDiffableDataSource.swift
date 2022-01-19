//
//  ManufacturorDiffableDataSource.swift
//  WestCoast-Cars
//
//  Created by Michael Gustavsson on 2022-01-13.
//

import UIKit

enum Section{
    case all
}

class ManufacturorDiffableDataSource: UITableViewDiffableDataSource<Section, Manufacturor> {
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
