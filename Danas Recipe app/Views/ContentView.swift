//
//  ContentView.swift
//  Danas Recipe app
//
//  Created by Dana Farhat on 2021-02-25.
//

import SwiftUI


struct ContentView: View {
    
    
    
   @ObservedObject var model = Recipemodel()
    var body: some View {
    
        
        
        NavigationView {
            
            List(model.recipes) { r in
                NavigationLink(
                    destination: detailview(recipe:r),
                    label: {
                        HStack(spacing: 7.0) {
                            Image(r.image).resizable().frame(width: 89.0, height: 89.0).cornerRadius(6.0)
                            Text(r.name)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                    })
            }.navigationBarTitle(Text("All Recipes"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
