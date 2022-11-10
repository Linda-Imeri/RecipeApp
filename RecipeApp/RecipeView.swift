//
//  ContentView.swift
//  RecipeApp
//
//  Created by Linda Imeri on 10.11.22.
//

import SwiftUI

struct RecipeView: View {
    @ObservedObject var viewModel = RecipeViewModel()
    
    var body: some View {
        List(viewModel.recipeArray){ recipe in
            HStack(spacing: 20.0){
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipped()
                    .cornerRadius(5)
                Text(recipe.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
