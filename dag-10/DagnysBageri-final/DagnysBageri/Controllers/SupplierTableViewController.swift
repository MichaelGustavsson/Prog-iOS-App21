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
    
    // Segues...
    // Forwarding Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSupplierDetailsSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! SupplierDetailsViewController
                
                destinationController.supplier = suppliers[indexPath.row]
            }
        }
    }
    
    // Unwind Segues
    @IBAction func closeSupplierDetailDialog(segue: UIStoryboardSegue){
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func updateSupplierDetails(segue: UIStoryboardSegue){
        guard let supplierController = segue.source as? SupplierDetailsViewController, let supplier = supplierController.supplier else {
            print("Något fungerade inte!!!")
            return
        }
     
        print(supplier)
        
        let index = suppliers.firstIndex(where: {$0.name == supplier.name})
        
        suppliers[index!] = supplier
        
        tableView.reloadData()
    }
}
