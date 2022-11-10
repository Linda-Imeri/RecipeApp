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
}
