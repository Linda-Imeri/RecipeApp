//
//  RecipeDetailView.swift
//  RecipeApp
//
//  Created by Linda Imeri on 10.11.22.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                //MARK: Recipe Image
                Image(recipe.image).resizable()
                    .scaledToFit()
                
                //MARK: Serving Size Picker
                VStack(alignment: .leading){
                    Text("Select your serving size: ")
                    Picker("",selection: $selectedServingSize ){
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }.pickerStyle(SegmentedPickerStyle())
                }
                .padding()
                .frame(width: 160)

                
                //MARK: Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom,.top],5)
                    
                    ForEach(recipe.ingredients){ ingredient in
                        Text("- " + ingredient.name)
                        
                    }
                }
                Divider()
                //MARK: Directions
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding(.bottom,5)
                    
                    ForEach(0..<recipe.directions.count,id: \.self) {
                        index in
                        Text(String(index+1) + ".  " + recipe.directions[index]).padding(.bottom, 5)
                    }
                }
            }.padding()
        }.navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RecipeViewModel()
        RecipeDetailView(recipe: viewModel.recipeArray[0])
    }
}
