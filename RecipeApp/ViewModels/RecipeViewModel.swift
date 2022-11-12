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
    
    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServings: Int) -> String {
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denomerator = ingredient.denom ?? 1
        var wholePortions = 0
        if ingredient.num != nil {
            
            //Get a single serving size by multiplying denominator by the recipe servings
            denomerator *= recipeServings
            //Get target portion by multiplying numerator by target servings
            numerator *= targetServings
            //Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denomerator)
            numerator /= divisor
            denomerator /= divisor
            //Get the whole portion if numerator > denominator
            if numerator >= denomerator{
                //Calculated whole portions
                wholePortions = numerator / denomerator
                
                //Calculate the remainder
                numerator = numerator % denomerator
                
                //Assign to portion string
                portion += String(wholePortions)
                
            }
            //Express the remainder as fraction
            if numerator > 0{
                //Asign remainder as fraction to the portion string
                portion += wholePortions > 0 ? " " :""
                portion += "\(numerator)/\(denomerator)"
                
            }
            
            if var unit = ingredient.unit {

                //If we need to pluralize
                if wholePortions > 1 {
                    
                    //Calculate appropriate suffix
                    if unit.suffix(2) == "ch"{
                        unit += "es"
                    }
                    else if unit.suffix(1) == "f"
                    {
                        unit = String(unit.dropLast())
                        unit += "ves"
                    }
                    else{
                        unit += "s"
                    }
                                
                }
                
                portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
               return portion + unit
            }
        }
       
        return portion
    }
}
