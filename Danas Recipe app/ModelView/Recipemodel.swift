//
//  recipe model .swift
//  Danas Recipe app
//
//  Created by Dana Farhat on 2021-02-25.
//

import Foundation

class Recipemodel: ObservableObject {
    
@Published  var recipes = [Recipe]()
    
    init () {
        
        self.recipes = decoder.decodingdata()
    }
}

