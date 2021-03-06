//
//  decoder.swift
//  Danas Recipe app
//
//  Created by Dana Farhat on 2021-02-25.
//

import Foundation

class decoder {

    static func decodingdata() -> [Recipe] {
    
        let pathstring = Bundle.main.path(forResource: "recipes", ofType: "json")
        if pathstring != nil {
        
            let url = URL(fileURLWithPath: pathstring!)
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                
                do { let recipedata = try decoder.decode([Recipe].self, from: data)
                    
                    for i in recipedata {
                        i.id = UUID()
                    }
                    return recipedata
                }
                catch {
                    print ("cannot parse data")
                }
            }
            catch {
            print( " cannot convert to data object")
            }
            
        }
        return [Recipe]()
    }
}
