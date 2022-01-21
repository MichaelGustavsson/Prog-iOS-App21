//
//  IngredientModel.swift
//  DagnysBageri
//
//  Created by Michael Gustavsson on 2022-01-21.
//

import Foundation

struct Ingredient: Hashable {
    var name: String
    var inStock: Int
    
    init(ingredientName: String, stock: Int){
        self.name = ingredientName
        self.inStock = stock
    }
}
