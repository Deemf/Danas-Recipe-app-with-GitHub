//
//  detailview.swift
//  Danas Recipe app
//
//  Created by Dana Farhat on 2021-03-01.
//

import SwiftUI

struct detailview: View {
    var recipe : Recipe
    @State var selectionindex = 2
    var body: some View {
        
        ScrollView{
            
            Image(recipe.image).resizable().scaledToFit()
            VStack(alignment:.leading, spacing: 0.0){
                VStack(alignment:.leading) {
                    Text(recipe.name)
                        .font(.largeTitle)
                        .bold()
                    Text("Select your portion size")
                    Picker("", selection: $selectionindex) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }.pickerStyle(SegmentedPickerStyle()).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }.padding(.bottom)

               
  
                VStack(alignment:.leading) {
                    Text("Ingredients").font(.headline).padding(.bottom,5)
                    ForEach(recipe.ingredients) { i in
                        Text(" • " + Recipemodel.getPortion(ingredients: i, userservingsize: selectionindex, servingsize: recipe.servings) + " " + i.name)
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
        }
    }
}


struct detailview_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = Recipemodel()
        detailview(recipe: model.recipes[0])
    }
}
