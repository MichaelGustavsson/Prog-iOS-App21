//
//  VehicleMakeTableViewController.swift
//  WestCoast-Cars
//
//  Created by Michael Gustavsson on 2022-01-11.
//

import UIKit

class VehicleMakeTableViewController: UITableViewController {
    
    
    // Steg 2. Skapa en variable/egenskap för att hantera vår datakälla...
    // Använd lazy nyckelordet för att vänta in att funktionen setUpDataSource är initierad...
    lazy var dataSource = setupDataSource()
        
    var manufacturors: [Manufacturor] = [
        Manufacturor(manufacturorName: "Ford", image: "ford", vehicles: [
            Vehicle(regNo: "ABC123", color: "Black", model: "Shelby", modelYear: 2021, mileage: 100, vehicleImage: "ford-shelby", manufacturor: "Ford"),
            Vehicle(regNo: "DEF123", color: "Brown Gray", model: "Kuga", modelYear: 2011, mileage: 119500, vehicleImage: "ford-kuga", manufacturor: "Ford")
        ]),
        Manufacturor(manufacturorName: "Volvo", image: "volvo", vehicles: [
            Vehicle(regNo: "GHI123", color: "Gray Metallic", model: "V90", modelYear: 2017, mileage: 89500, vehicleImage: "volvo-v90", manufacturor: "Volvo"),
            Vehicle(regNo: "JKL123", color: "White", model: "V40", modelYear: 2018, mileage: 69500, vehicleImage: "volvo-v40", manufacturor: "Volvo"),
            Vehicle(regNo: "MNO123", color: "Darkblue Metallic", model: "V60", modelYear: 2019, mileage: 32500, vehicleImage: "volvo-v60", manufacturor: "Volvo")
        ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        
        // Steg 3. Initiera vår tableViews dataSource att använda vår datakälla
        // Steg 3.1
        tableView.dataSource = dataSource //Anslutit vår datakälla till tableView

        // Steg 3.2 Skapa ett snapshot av datat
        var snapshot = NSDiffableDataSourceSnapshot<Section, Manufacturor>()
        
        // Steg 3.3 Lägg till antal eller vilka sektioner som skall ingå i vårt snapshot
        snapshot.appendSections([.all])
        // Vilket data skall användas och till vilken sektion/grupp skall vi addera det till...
        snapshot.appendItems(manufacturors, toSection: .all)
        
        // Steg 3.4 Lägg till vårt snapshot till vår datakälla...
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    // Steg 1. Konfigurera datakällan till att använda ManufacturorDiffableDataSource...
    func setupDataSource() -> ManufacturorDiffableDataSource{
        //let cellIdentifier = "makeBaseCell"
        //let cellIdentifier = "makeFancyCell"
        let cellIdentifier = "makeNiceCell"
        // Skapa en instans av UITableViewDiffableDatasource...
        let dataSource = ManufacturorDiffableDataSource(tableView: tableView,
                                                                        cellProvider: {
            //Closure
            tableView,
            indexPath,
            manufacturor in let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MakeTableViewCell
            
            cell.makeNameLabel.text = manufacturor.name
            cell.availabilityLabel.text = "\(manufacturor.availableVehicles)"
            cell.thumbnailImage.image = UIImage(named: manufacturor.logoImage)
            
            return cell
        })
        // Returnera den nyligen skapade datakällan ovan...
        return dataSource
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Kontrollera vilken segue som vi skall navigera via...
        if segue.identifier == "AvailableVehiclesForMake" {
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! VehicleMakeDetailsViewController
                
                //destinationController.makeName = vehicles[indexPath.row]
                destinationController.manufacturor = manufacturors[indexPath.row]
            }
        }
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Hämta vald tillverkare för markerad rad(cell)
        guard let manufacturor = self.dataSource.itemIdentifier(for: indexPath) else {
            return UISwipeActionsConfiguration()
        }
        
        //Skapa en delete/ta bort händelse(Action)
        let deleteAction = UIContextualAction(style: .destructive, title: "Ta Bort") {
            //Skapa closure...
            (action, sourceView, completionHandler) in
            
            var snapshot = self.dataSource.snapshot()
            //Indikera borttagning av hittat objekt ur tabellen från vårt snapshot
            snapshot.deleteItems([manufacturor])
            
            //Ta bort det på riktigt!
            self.dataSource.apply(snapshot, animatingDifferences: true)
            
            // Stäng ner deleteAction...
            completionHandler(true)
        }
        
        //Skapa en delete/ta bort händelse(Action)
        let anotherAction = UIContextualAction(style: .normal, title: "Extra") {
            //Skapa closure...
            (action, sourceView, completionHandler) in
            
            // Stäng ner anotherAction...
            completionHandler(true)
        }
        
        //deleteAction.backgroundColor = UIColor.systemMint
        deleteAction.image = UIImage(systemName: "trash")
        
        anotherAction.backgroundColor = UIColor.systemBlue
        anotherAction.image = UIImage(systemName: "heart")
        
        let swipeConfig = UISwipeActionsConfiguration(actions: [deleteAction, anotherAction])
        
        return swipeConfig
    }
    //Göm topp menyn
    override var prefersStatusBarHidden: Bool{
        return true
    }
}
