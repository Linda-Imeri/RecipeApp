//
//  DataService.swift
//  RecipeApp
//
//  Created by Linda Imeri on 10.11.22.
//

import Foundation

class DataService : Decodable{
    
    static func getLocalData() -> [Recipe] {
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            return [Recipe]()
        }
        let url = URL(fileURLWithPath: pathString!)
        
        do{
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            do{
                let recipeData = try  decoder.decode([Recipe].self, from: data)
                
                //Add unique IDs to recipe ingredients
                for recipe in recipeData{
                    recipe.id = UUID()
                    
                    //Add unique IDs to recipe ingredients
                    for ingredient in recipe.ingredients {
                        ingredient.id = UUID()
                    }
                }
                return recipeData
            }catch{
                print(error)
            }
        }
        
        catch{
            print(error)
        }
        return [Recipe]()
    }
}
