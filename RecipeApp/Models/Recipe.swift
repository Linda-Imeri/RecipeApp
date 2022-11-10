//
//  Recipe.swift
//  RecipeApp
//
//  Created by Linda Imeri on 10.11.22.
//

import Foundation

struct Recipe: Identifiable{
    var id: UUID?
    var name: String
    var toppings: [String]
}
