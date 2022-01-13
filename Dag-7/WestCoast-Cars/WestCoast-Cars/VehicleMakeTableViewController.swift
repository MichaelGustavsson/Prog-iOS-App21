//
//  VehicleMakeTableViewController.swift
//  WestCoast-Cars
//
//  Created by Michael Gustavsson on 2022-01-11.
//

import UIKit

class VehicleMakeTableViewController: UITableViewController {
    
    enum Section{
        case all
    }
    
    // Steg 2. Skapa en variable/egenskap för att hantera vår datakälla...
    // Använd lazy nyckelordet för att vänta in att funktionen setUpDataSource är initierad...
    lazy var dataSource = setupDataSource()
    
    var vehicles = ["Ford", "Volvo", "Tesla", "Dacia", "Volkswagen", "Polestar", "Toyota", "Nissan"]
    var logos = ["ford", "volvo", "tesla", "dacia", "volkswagen", "polestar", "toyota", "nissan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Steg 3. Initiera vår tableViews dataSource att använda vår datakälla
        // Steg 3.1
        tableView.dataSource = dataSource //Anslutit vår datakälla till tableView

        // Steg 3.2 Skapa ett snapshot av datat
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        
        // Steg 3.3 Lägg till antal eller vilka sektioner som skall ingå i vårt snapshot
        snapshot.appendSections([.all])
        // Vilket data skall användas och till vilken sektion/grupp skall vi addera det till...
        snapshot.appendItems(vehicles, toSection: .all)
        
        // Steg 3.4 Lägg till vårt snapshot till vår datakälla...
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    // Steg 1. Konfigurera datakällan till att använda UITableViewDiffableDataSource...
    func setupDataSource() -> UITableViewDiffableDataSource<Section, String>{
        //let cellIdentifier = "makeBaseCell"
        //let cellIdentifier = "makeFancyCell"
        let cellIdentifier = "makeNiceCell"
        // Skapa en instans av UITableViewDiffableDatasource...
        let dataSource = UITableViewDiffableDataSource<Section, String>(tableView: tableView,
                                                                        cellProvider: {
            //Closure
            tableView,
            indexPath,
            manufacturors in let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MakeTableViewCell
            
            cell.makeNameLabel.text = manufacturors
            cell.availabilityLabel.text = "Antal bilar i lager 4"
            cell.thumbnailImage.image = UIImage(named: self.logos[indexPath.row])
            
            return cell
        })
        // Returnera den nyligen skapade datakällan ovan...
        return dataSource
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AvailableVehiclesForMake" {
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! VehicleMakeDetailsViewController
                
                destinationController.makeName = vehicles[indexPath.row]
            }
        }
    }

    //Göm topp menyn
    override var prefersStatusBarHidden: Bool{
        return true
    }
}
