//
//  FeaturedView.swift
//  Danas Recipe app
//
//  Created by Dana Farhat on 2021-03-08.
//

import SwiftUI

struct FeaturedView: View {
   @EnvironmentObject var model:Recipemodel
    @State var showDetailRecipe = false
    @State var tabSelectionIndex = 0
    
    func setFeaturedIndex() {
   var index =  model.recipes.firstIndex { (recipes) -> Bool in
            return recipes.featured
        }
        tabSelectionIndex = index ?? 0
    }
    
    var body: some View {
        
        
        VStack(alignment:.leading ,spacing: 5){
            Text("Featured View")
                .font(.largeTitle)
                .bold()
            GeometryReader { geo in
                
                TabView(selection : $tabSelectionIndex) {
                    ForEach(0..<model.recipes.count) { f in
                        if model.recipes[f].featured == true {
                            Button(action: { self.showDetailRecipe = true },
                                   label: {
                                    ZStack {
                                        Rectangle().foregroundColor(.white)
                                        VStack {
                                            Image(model.recipes[f].image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                            Text(model.recipes[f].name)
                                        }
                                    }
                            })
                                .tag(f)
                            .sheet(isPresented: $showDetailRecipe) {
                                detailview(recipe:model.recipes[f])
                            }
                            .frame(width: geo.size.width - 50, height: geo.size.height - 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(10.0)
                            .shadow(color: .yellow, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        }
                }
                    
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode:.always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))

            }
            Text("Preparation Time: ").bold()
            Text(model.recipes[tabSelectionIndex].prepTime)
            Text("Highlights").bold()
            Text(model.recipes[tabSelectionIndex].highlights)
        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
    .padding()
    }


}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView().environmentObject(Recipemodel())
    }
}
