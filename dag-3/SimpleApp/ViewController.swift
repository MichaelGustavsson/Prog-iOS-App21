//
//  ViewController.swift
//  SimpleApp
//
//  Created by Michael Gustavsson on 2021-12-09.
//

import UIKit

class ViewController: UIViewController {

    //Egenskap/Property...
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var changeTextValue: UITextField!
    @IBOutlet weak var diceImage: UIImageView!
    @IBOutlet weak var changeHeaderText: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerLabel.text = "Min super APP!"
    }

    @IBAction func changeTextButton(_ sender: UIButton) {
        headerLabel.text = changeTextValue.text
    }
    
    @IBAction func changeImageButton(_ sender: UIButton) {
        diceImage.image = #imageLiteral(resourceName: "dice-5")
        changeHeaderText.setTitle("Nytt namn", for: .normal)
    }
}

