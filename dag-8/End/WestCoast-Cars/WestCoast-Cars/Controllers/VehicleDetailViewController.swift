//
//  VehicleDetailViewController.swift
//  WestCoast-Cars
//
//  Created by Michael Gustavsson on 2022-01-18.
//

import UIKit

class VehicleDetailViewController: UIViewController {
    
    @IBOutlet var modelLabel: UILabel!
    @IBOutlet var modelYearLabel: UILabel!
    
    var vehicle: Vehicle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modelLabel.text = vehicle?.model
        modelYearLabel.text = "\(vehicle?.modelYear ?? 2015)"
    }
    
}
