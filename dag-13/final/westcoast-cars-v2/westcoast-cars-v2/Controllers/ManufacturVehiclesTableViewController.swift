//
//  ManufacturVehiclesTableViewController.swift
//  westcoast-cars-v2
//
//  Created by Michael Gustavsson on 2022-01-28.
//

import UIKit

class ManufacturVehiclesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "makeVehicleCell", for: indexPath)

        // Configure the cell...
        
        return cell
    }
    
}
