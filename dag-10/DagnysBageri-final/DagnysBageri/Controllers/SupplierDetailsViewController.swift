//
//  SupplierDetailsViewController.swift
//  DagnysBageri
//
//  Created by Michael Gustavsson on 2022-01-21.
//

import UIKit

class SupplierDetailsViewController: UIViewController {

    @IBOutlet var supplierNameLabel: UILabel!
    @IBOutlet var customerNumberLabel: UILabel!
    
    @IBOutlet var contactInput: UITextField!
    @IBOutlet var phoneInput: UITextField!
    @IBOutlet var emailInput: UITextField!
    
    var supplier: Supplier?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        supplierNameLabel.text = supplier?.name
        customerNumberLabel.text = supplier?.customerNumber
        contactInput.text = supplier?.contact
        phoneInput.text = supplier?.phone
        emailInput.text = supplier?.email
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        supplier = Supplier(supplierName: supplierNameLabel.text!)
        supplier?.email = emailInput.text!
        supplier?.phone = phoneInput.text!
        supplier?.contact = contactInput.text!
    }

}
