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
    
    var imgIdx = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerLabel.text = "Min super APP!"
        diceImage.image = #imageLiteral(resourceName: "dice-1")
    }

    @IBAction func changeTextButton(_ sender: UIButton) {
        headerLabel.text = changeTextValue.text
    }
    
    @IBAction func changeImageButton(_ sender: UIButton) {
        let images = [ #imageLiteral(resourceName: "dice-1"), #imageLiteral(resourceName: "dice-2"), #imageLiteral(resourceName: "dice-3"), #imageLiteral(resourceName: "dice-4"), #imageLiteral(resourceName: "dice-5"), #imageLiteral(resourceName: "dice-6")]
        var array = [1,2,3,4,5,6,7,8,9]
        
        print(array)
        
        array.shuffle()
        print(array)
        
        array.sort()
        print(array)
        
        diceImage.image = images.randomElement()
//        print(Int.random(in: 1...20))
        
//        diceImage.image = images[Int.random(in: 0..<images.count)]
        
//        diceImage.image = [ #imageLiteral(resourceName: "dice-1"), #imageLiteral(resourceName: "dice-2"), #imageLiteral(resourceName: "dice-3"), #imageLiteral(resourceName: "dice-4"), #imageLiteral(resourceName: "dice-5"), #imageLiteral(resourceName: "dice-6")][Int.random(in: 0...5)]
//
//        imgIdx += 1
//        changeHeaderText.setTitle("Nytt namn", for: .normal)
    }
}

