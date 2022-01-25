//
//  UpdatingStockViewController.swift
//  DagnysBageri
//
//  Created by Michael Gustavsson on 2022-01-21.
//

import UIKit

class UpdatingStockViewController: UIViewController {
    
    @IBOutlet var ingredientName: UILabel!
    @IBOutlet var inStock: UITextField!
    
    // Denna egenskap/variable kommer att populeras av avsändare = IngredientsTableViewController via dess segue...
    var ingredient: Ingredient?

    override func viewDidLoad() {
        super.viewDidLoad()

        ingredientName.text = ingredient?.name
        inStock.text = String(ingredient!.inStock)
    }
    
    // Garanterad att köras innan navigeringen påbörjas...
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        ingredient = Ingredient(ingredientName: ingredient!.name, stock: Int(inStock.text!)!)
    }
}
