//
//  VehicleMakeDetailsViewController.swift
//  WestCoast-Cars
//
//  Created by Michael Gustavsson on 2022-01-11.
//

import UIKit

class VehicleMakeDetailsViewController: UIViewController{ //, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: MakeDetailHeaderView!
    
    lazy var dataSource = setupDataSource()
    var manufacturor: Manufacturor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView.makeNameLabel.text = manufacturor?.name
        headerView.logoImage.image = UIImage(named: manufacturor!.logoImage)
        headerView.vehiclesInStock.text = "\(manufacturor?.availableVehicles ?? 0)"
        
        // Sätta upp och konstruera ett snapshot
        tableView.dataSource = dataSource
        var snapshot = NSDiffableDataSourceSnapshot<Section, Vehicle>()
        
        snapshot.appendSections([.all])
        snapshot.appendItems(manufacturor!.vehicles, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func setupDataSource() -> UITableViewDiffableDataSource<Section, Vehicle>{
        let cellIdentifier = "vehicleCell"
        let dataSource = VehicleDiffableDataSource(tableView: tableView, cellProvider: {
            tableView,
            indexPath,
            vehicle in let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            
            cell.textLabel?.text = "Bilmodell \(vehicle.model)"
            cell.detailTextLabel?.text = "Modell år \(vehicle.modelYear) Antal km \(vehicle.mileage)"
            
            return cell
        })
        return dataSource
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showVehicleDetailsSegue"){
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! VehicleDetailViewController
                
                destinationController.vehicle = manufacturor?.vehicles[indexPath.row]
            }
        }
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return manufacturor?.vehicles.count ?? 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cellIdentifier = "vehicleCell";
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
//
//        cell.textLabel?.text = "Bilmodell \(manufacturor?.vehicles[indexPath.row].model ?? "")"
//        cell.detailTextLabel?.text = "Årsmodell \(manufacturor?.vehicles[indexPath.row].modelYear ?? 2015) Antal km \(manufacturor?.vehicles[indexPath.row].mileage ?? 0)"
//
//        return cell
//
//    }
}
