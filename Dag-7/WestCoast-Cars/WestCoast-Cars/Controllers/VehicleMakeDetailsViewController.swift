//
//  VehicleMakeDetailsViewController.swift
//  WestCoast-Cars
//
//  Created by Michael Gustavsson on 2022-01-11.
//

import UIKit

class VehicleMakeDetailsViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: MakeDetailHeaderView!
    
    var manufacturor: Manufacturor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(manufacturor)

        // Do any additional setup after loading the view.
        
        headerView.makeNameLabel.text = manufacturor?.name
        headerView.logoImage.image = UIImage(named: manufacturor!.logoImage)
        headerView.vehiclesInStock.text = "\(manufacturor?.availableVehicles ?? 0)"
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
