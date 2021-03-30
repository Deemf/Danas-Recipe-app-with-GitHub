//
//  FeaturedView.swift
//  Danas Recipe app
//
//  Created by Dana Farhat on 2021-03-08.
//

import SwiftUI

struct FeaturedView: View {
   @EnvironmentObject var model:Recipemodel
    
    var body: some View {
        VStack(alignment:.leading ,spacing: 5){
            Text("Featured View")
                .font(.largeTitle)
                .bold()
            GeometryReader { geo in
                
                TabView {
                    ForEach(0..<model.recipes.count) { f in
                        if model.recipes[f].featured == true {
                            ZStack {
                                Rectangle().foregroundColor(.white)
                                VStack {
                                    Image(model.recipes[f].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                    Text(model.recipes[f].name)
                                }
                            }.frame(width: geo.size.width - 50, height: geo.size.height - 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(10.0)
                            .shadow(color: .yellow, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        }
                }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode:.always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            Text("Preparation Time:").bold()
            Text("1 hour")
            Text("Highlights:").bold()
            Text("creamy,rich,yummy")
        }.padding()
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView().environmentObject(Recipemodel())
    }
}
