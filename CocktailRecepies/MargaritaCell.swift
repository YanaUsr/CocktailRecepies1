//
//  MargaritaCell.swift
//  CocktailRecepies
//
//  Created by Яна Иноземцева on 12.04.2022.
//

import UIKit

class MargaritaCell: UITableViewCell {

    @IBOutlet var nameOfMargaritaLabel: UILabel!
    @IBOutlet var margaritaImage: UIImageView!
    @IBOutlet var typeOfCoctailLabel: UILabel!
    
    
    func configure(with cocktail: Cocktail) {
        
        nameOfMargaritaLabel.text = cocktail.strDrink
        typeOfCoctailLabel.text = cocktail.strAlcoholic
        
        guard let url = URL(string: cocktail.strDrinkThumb  ?? "") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }

            DispatchQueue.main.async {
                self.margaritaImage.image = UIImage(data: data)
                self.margaritaImage.layer.cornerRadius = self.margaritaImage.frame.height / 2
            }
        }.resume()
    }

}
