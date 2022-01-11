//
//  VehicleMakeTableViewController.swift
//  WestCoast-Cars
//
//  Created by Michael Gustavsson on 2022-01-11.
//

import UIKit

class VehicleMakeTableViewController: UITableViewController {
    var vehicles = ["Ford", "Volvo", "Tesla", "Dacia", "Volkswagen", "Polestar", "Toyota", "Nissan"]
    var logos = ["ford", "volvo", "tesla", "dacia", "volkswagen", "polestar", "toyota", "nissan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //Hur många sektioner i vår tabell behöver vi?
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vehicles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "makeBaseCell"
//        let cellIdentifier = "makeFancyCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MakeTableViewCell
        
        //Konfigurera vår prototyp cell...
        cell.makeNameLabel.text = vehicles[indexPath.row]
        cell.availabilityLabel.text = "Antal bilar i lager 2"
        cell.thumbnailImage.image = UIImage(named: logos[indexPath.row])
        
        return cell
    }
    
    //Göm topp menyn
    override var prefersStatusBarHidden: Bool{
        return true
    }
}
