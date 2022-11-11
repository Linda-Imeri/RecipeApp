//
//  RecipeFeaturedView.swift
//  RecipeApp
//
//  Created by Linda Imeri on 11.11.22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var viewModel : RecipeViewModel
    var body: some View {
        GeometryReader{ geo in
            TabView{
                ForEach(0..<viewModel.recipeArray.count){ index in
                    
                    //Show only those that should be feautured
                    if viewModel.recipeArray[index].featured {
                        
                        //Recipe Card
                        Rectangle()
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(radius: 10)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .shadow(radius: 10)
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeViewModel())
    }
}
