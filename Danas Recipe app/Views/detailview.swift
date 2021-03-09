//
//  detailview.swift
//  Danas Recipe app
//
//  Created by Dana Farhat on 2021-03-01.
//

import SwiftUI

struct detailview: View {
    var recipe : Recipe
    var body: some View {
        
        ScrollView{
            
            Image(recipe.image).resizable().scaledToFit()
            VStack(alignment:.leading, spacing: 0.0){
               
  
                VStack(alignment:.leading) {
                    Text("Ingredients").font(.headline).padding(.bottom,5)
                    ForEach (recipe.ingredients) { r in
                        Text("• " + r.name)
                    }
                }
                Divider()
                VStack(alignment:.leading) {
                    Text("Directions").font(.headline).padding(.vertical,5)
                    ForEach (0..<recipe.directions.count , id: \.self) { index in
                        Text(String(index+1) + ". " + recipe.directions[index] )
                            .lineLimit(nil)
                    }
                }
        
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            
            
        }.navigationBarTitle(Text(recipe.name))
    }
}


struct detailview_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = Recipemodel()
        detailview(recipe: model.recipes[0])
    }
}
