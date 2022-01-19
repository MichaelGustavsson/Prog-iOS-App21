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
    @IBOutlet var mileageLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var vehicleImage: UIImageView!
    
    var vehicle: Vehicle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modelLabel.text = "Modell: \(vehicle?.model ?? "")"
        modelYearLabel.text = "Modell år: \(vehicle?.modelYear ?? 2015)"
        mileageLabel.text = "Antal km: \(vehicle?.mileage ?? 0)"
        descriptionLabel.text = vehicle?.description ?? ""
        vehicleImage.image = UIImage(named: vehicle!.image)
    }
    
}
