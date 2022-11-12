//
//  RecipeFeaturedView.swift
//  RecipeApp
//
//  Created by Linda Imeri on 11.11.22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    //MARK: Properties
    @EnvironmentObject var viewModel : RecipeViewModel
    @State var isDetailViewShowing = false
    
    var body: some View {
        VStack(alignment: .leading,spacing: 0){
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top,40)
                .font(.largeTitle)
            
            GeometryReader{ geo in
                TabView{
                    ForEach(0..<viewModel.recipeArray.count){ index in
                        
                        //Show only those that should be feautured
                        if viewModel.recipeArray[index].featured {
                            //Recipe card button
                            Button(action: {
                                //Show the recipe detail sheet
                                self.isDetailViewShowing = true
                                
                            }, label: {
                                //Recipe Card
                                ZStack{
                                    Rectangle().foregroundColor(.white)
                                    
                                    VStack(spacing: 0){
                                        Image(viewModel.recipeArray[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(viewModel.recipeArray[index].name).padding(5)
                                    }

                                }
                            })
                            .sheet(isPresented: $isDetailViewShowing ){
                                //Show the Recipe Detail View
                                RecipeDetailView(recipe: viewModel.recipeArray[index])
                                
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                                .cornerRadius(15)
                                .shadow(radius: 10)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5),radius: 10, x: -5, y: 5)
            }
            
            VStack(alignment: .leading,spacing: 10){
                Text("Preparation Time")
                    .font(.headline)
                Text("1 hour")
                Text("Highlight")
                    .font(.headline)
                Text("Healthy,Healthy")
            }
            .padding([.leading,.bottom])
        }
       
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeViewModel())
    }
}
