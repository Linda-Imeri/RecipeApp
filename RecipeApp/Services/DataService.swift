//
//  DataService.swift
//  RecipeApp
//
//  Created by Linda Imeri on 10.11.22.
//

import Foundation

class DataService : Decodable{
    
    func getLocalData() -> [Recipe] {
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
                for recipe in recipeData{
                    recipe.id = UUID()
                }
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
