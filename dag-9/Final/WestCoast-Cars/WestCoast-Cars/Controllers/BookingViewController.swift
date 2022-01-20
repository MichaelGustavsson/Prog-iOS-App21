//
//  BookingViewController.swift
//  WestCoast-Cars
//
//  Created by Michael Gustavsson on 2022-01-20.
//

import UIKit

class BookingViewController: UIViewController {

    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var vehicleInfoLabel: UILabel!
    @IBOutlet var firstNameInput: UITextField!
    @IBOutlet var lastNameInput: UITextField!
    @IBOutlet var emailInput: UITextField!
    @IBOutlet var phoneInput: UITextField!
    
    var vehicle: Vehicle?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImage.image = UIImage(named: "bookingBackground")
        
        vehicleInfoLabel.text = "\(vehicle?.vehicleName ?? "")"
        
    }
    
    @IBAction func sendBookingButton(_ sender: UIButton){
        let bookingModel = BookingInfo(firstName: firstNameInput.text!, lastName: lastNameInput.text!, email: emailInput.text!, phone: phoneInput.text!)
        
        //print(bookingModel)
    }


}
