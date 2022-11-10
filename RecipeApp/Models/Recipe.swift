//
//  Recipe.swift
//  RecipeApp
//
//  Created by Linda Imeri on 10.11.22.
//

import Foundation

class Recipe: Identifiable, Decodable{
    
    var id: UUID?
    var name: String
    var featured: Bool
    var description: String
    var prepTime: String
    var cookTime: String
    var totalTime: String
    var servings: Int
    var highlights: [String]
    var ingredients: [String]
    var directions: [String]
    
}
