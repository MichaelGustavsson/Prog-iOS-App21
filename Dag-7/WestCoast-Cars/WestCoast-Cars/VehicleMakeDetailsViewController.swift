//
//  VehicleMakeDetailsViewController.swift
//  WestCoast-Cars
//
//  Created by Michael Gustavsson on 2022-01-11.
//

import UIKit

class VehicleMakeDetailsViewController: UIViewController {

    @IBOutlet var makeNameLabel: UILabel!
    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var vehiclesInStock: UILabel!
    
    // Public variable/egenskap som vi kan nå utifrån och sätta ett värde...
//    var makeName = ""
    //skapa en nullable egenskap
    var manufacturor: Manufacturor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        makeNameLabel.text = manufacturor?.name
        logoImage.image = UIImage(named: manufacturor!.logoImage)
        vehiclesInStock.text = "\(manufacturor?.availableVehicles ?? 0)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
