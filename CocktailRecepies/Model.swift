//
//  Model.swift
//  CocktailRecepies
//
//  Created by Яна Иноземцева on 12.04.2022.
//

import Foundation

struct Cocktail: Decodable {
    
    let strDrink: String?
    let strAlcoholic: String?
    let strDrinkThumb: String?
    let strInstructions: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?

    var composition: String {
        var compositionInStringFormat = "Ingredients:\n"
        let allIngredients = [
            strIngredient1,
            strIngredient2,
            strIngredient3,
            strIngredient4,
            strIngredient5,
            strIngredient6,
            strIngredient7,
            strIngredient8,
            strIngredient9,
            strIngredient10,
            strIngredient11,
            strIngredient12,
            strIngredient13,
            strIngredient14,
            strIngredient15
        ]

        for ingredient in allIngredients {
            if let ingredient = ingredient {
                compositionInStringFormat += "\(ingredient)\n"
            }
        }
        return compositionInStringFormat
    }
    
}

struct Drink: Decodable {
    let drinks: [Cocktail]
}
