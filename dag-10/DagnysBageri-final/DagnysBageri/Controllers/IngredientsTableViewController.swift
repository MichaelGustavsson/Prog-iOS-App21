//
//  IngredientsTableViewController.swift
//  DagnysBageri
//
//  Created by Michael Gustavsson on 2022-01-21.
//

import UIKit

class IngredientsTableViewController: UITableViewController {
    
    var ingredients: [Ingredient] = [
        Ingredient(ingredientName: "Vetemjöl", stock: 4000),
        Ingredient(ingredientName: "Socker", stock: 500),
        Ingredient(ingredientName: "Bakpulver", stock: 225),
        Ingredient(ingredientName: "Mjölkpulver", stock: 175),
        Ingredient(ingredientName: "Salt", stock: 50),
        Ingredient(ingredientName: "Vetegluten", stock: 375),
        Ingredient(ingredientName: "Rågmjöl", stock: 575),
        Ingredient(ingredientName: "Margin", stock: 600),
        Ingredient(ingredientName: "Kardemumma", stock: 40)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath)

        cell.textLabel?.text = ingredients[indexPath.row].name
        cell.detailTextLabel?.text = String(ingredients[indexPath.row].inStock)
//        cell.detailTextLabel?.text = "\(ingredients[indexPath.row].inStock)"

        return cell
    }
    
    // Prepare for segue...
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showIngredientInStockSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! UpdatingStockViewController
                
                destinationController.ingredient = ingredients[indexPath.row]
            }
        }
    }
    
    // Unwind Segues
    // Stäng dialogrutan utan att ta hand om någonting
    @IBAction func closeDialog(segue: UIStoryboardSegue){
        dismiss(animated: true, completion: nil)
    }
    
    // Stänga dialogrutan och ta hand om data som returneras...
    @IBAction func updateStock(segue: UIStoryboardSegue){
        guard let updateController = segue.source as? UpdatingStockViewController, let ingredient = updateController.ingredient else {
            
            return
        }
        
        print("Råvara uppdaterad ifrån UpdatingInStockViewController \(ingredient)")
        // Hämta ut indexet för den position som vald ingrediens har...
        //$0 indikerar/visar aktuellt element/objekt i listan
        let index = ingredients.firstIndex(where: {$0.name == ingredient.name})
        
        ingredients[index!].inStock = ingredient.inStock
        
        print("Uppdaterad ingredients array \(ingredients)")
        
        // Uppdatera table view med nytt data ifrån vår array...
        tableView.reloadData()

    }
}
