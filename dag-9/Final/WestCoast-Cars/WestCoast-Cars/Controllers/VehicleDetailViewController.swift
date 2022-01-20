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
    
    // Här kommer funktionerna (Metoderna)
    /* Detta är vår unwind segue för X knappen i dialogrutan för BookingViewController */
    @IBAction func closeBookingDialog(segue: UIStoryboardSegue){
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showBookingSegue"){
            let bookingVehicleController = segue.destination as! BookingViewController
            
            bookingVehicleController.vehicle = vehicle
        }
    }
    
}
