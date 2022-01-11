//
//  ViewController.swift
//  WestCoast-Cars
//
//  Created by Michael Gustavsson on 2022-01-11.
//

import UIKit

// Steg 1. Implementera Protocol...
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var vehicles = ["Ford", "Volvo", "Tesla", "Dacia", "Volkswagen", "Polestar", "Toyota", "Nissan"]
    var logos = ["ford", "volvo", "tesla", "dacia", "volkswagen", "polestar", "toyota", "nissan"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicles.count
    }
    
    //Konstruerar vår tabell cell(rad), anropas för varje element som finns i datat...
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "makeInfoCell"
        
        // Konvertera(downcast) till vår nya klass MakeTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MakeTableViewCell
        
        //Sätt värden på våra IBOutlet variabler...
        cell.makeNameLabel.text = vehicles[indexPath.row]
        cell.availabilityLabel.text = "Antal bilar i lager 3"
        cell.thumbnailImage.image = UIImage(named: logos[indexPath.row])
        
//        cell.textLabel?.text = vehicles[indexPath.row]
//        cell.detailTextLabel?.text = "Antal i lager 3"
//        cell.imageView?.image = UIImage(named: logos[indexPath.row])
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

