//
//  SupplierTableViewController.swift
//  DagnysBageri
//
//  Created by Michael Gustavsson on 2022-01-21.
//

import UIKit

class SupplierTableViewController: UITableViewController {

    var suppliers: [Supplier] = [
        Supplier(supplierName: "Kobia"),
        Supplier(supplierName: "Engelhardt"),
        Supplier(supplierName: "Kåkå")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suppliers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "supplierCell", for: indexPath)

        cell.textLabel?.text =  suppliers[indexPath.row].name
        cell.detailTextLabel?.text = suppliers[indexPath.row].phone

        return cell
    }
}
