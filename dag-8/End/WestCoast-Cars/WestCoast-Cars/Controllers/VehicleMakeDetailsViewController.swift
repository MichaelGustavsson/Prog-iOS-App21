//
//  VehicleMakeDetailsViewController.swift
//  WestCoast-Cars
//
//  Created by Michael Gustavsson on 2022-01-11.
//

import UIKit

class VehicleMakeDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: MakeDetailHeaderView!
    
    var manufacturor: Manufacturor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(manufacturor!)

        // Do any additional setup after loading the view.
        
        headerView.makeNameLabel.text = manufacturor?.name
        headerView.logoImage.image = UIImage(named: manufacturor!.logoImage)
        headerView.vehiclesInStock.text = "\(manufacturor?.availableVehicles ?? 0)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manufacturor?.vehicles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "vehicleCell";
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = "Bilmodell \(manufacturor?.vehicles[indexPath.row].model ?? "")"
        cell.detailTextLabel?.text = "Årsmodell \(manufacturor?.vehicles[indexPath.row].modelYear ?? 2015) Antal km \(manufacturor?.vehicles[indexPath.row].mileage ?? 0)"
        
        return cell
        
    }
}
