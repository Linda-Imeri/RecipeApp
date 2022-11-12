//
//  ContentView.swift
//  RecipeApp
//
//  Created by Linda Imeri on 10.11.22.
//

import SwiftUI

struct RecipeView: View {
    @EnvironmentObject var viewModel: RecipeViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                Text("All Recipes") .bold()
                       .padding(.top,40)
                    .font(.largeTitle)
                
                ScrollView{
                    LazyVStack(alignment: .leading){
                        ForEach(viewModel.recipeArray){ recipe in
                            NavigationLink(destination: RecipeDetailView(recipe: recipe),
                                           label: {
                                HStack(spacing: 20.0){
                                    Image(recipe.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    VStack(alignment: .leading){
                                        Text(recipe.name)
                                            .foregroundColor(.black)
                                            .bold()
                                        RecipeHighlights(highlights: recipe.highlights)
                                            .foregroundColor(.black)
                                    }
                                    
                                }
                            })
                            
                        }
                    }
                }
                
            }
            .navigationBarHidden(true)
            .padding(.leading)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView().environmentObject(RecipeViewModel())
    }
}
