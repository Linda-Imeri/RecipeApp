//
//  RecipeViewModel.swift
//  RecipeApp
//
//  Created by Linda Imeri on 10.11.22.
//

import Foundation

class RecipeViewModel: ObservableObject{
    @Published var recipeArray = [Recipe]()
    
    init(){
        self.recipeArray = DataService.getLocalData()
    }
    func getPortion(){
        //Get a single serving size by multiplying denominator by the recipe servings
        
        //Get target portion by multiplying numerator by target servings
        
        //Reduce fraction by greatest common divisor
        
        //Get the whole portion if numerator > denominator
        
        //Express the remainder as fraction 
    }
}
