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
  static  func getPortion(ingredients:Ingredients,userservingsize:Int, servingsize:Int) -> String {
        var portion = " "
        var numerator = ingredients.num ?? 1
        var denomenator = ingredients.denom ?? 1
        var fullportion = 0
        var unit = ingredients.unit ?? ""
        
        numerator *= userservingsize
        denomenator *= servingsize
        
    let divisor = Rational.greatestCommonDivisor(numerator,denomenator)
        
        numerator /= divisor
        denomenator /= divisor
        
        if numerator >= denomenator {
            
            fullportion = numerator/denomenator
            numerator = numerator % denomenator
            portion += String(fullportion)
        
        }

    if unit != "" {
        if fullportion > 1 {
            if unit.suffix(1) == "f" {
                unit = String(unit.dropLast())
                unit += "ves"
            } else if unit.suffix(2) == "ch" {
                unit += "es"
            } else {
                unit += "s"
            }
        }
    }
    
        if numerator > 0 {
                portion += fullportion > 0 ? " " : ""
                portion += "\(numerator)/\(denomenator)"
            }
        
    return portion + " " + unit
    }
}

