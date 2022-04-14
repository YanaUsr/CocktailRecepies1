//
//  DetailedInformation.swift
//  CocktailRecepies
//
//  Created by Яна Иноземцева on 14.04.2022.
//

import UIKit

class DetailedInformation: UIViewController {

    @IBOutlet var imageMargarita: UIImageView!
    @IBOutlet var recepyLabel: UILabel!
    @IBOutlet var ingridientsLabel: UILabel!
    
    var cocktail: Cocktail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

    }
    
    
    func configure() {
        
        recepyLabel.text = cocktail?.strInstructions
        ingridientsLabel.text = cocktail?.composition
        
        
        guard let url = URL(string: cocktail?.strDrinkThumb  ?? "") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }

            DispatchQueue.main.async {
                self.imageMargarita.image = UIImage(data: data)
                
            }
        }.resume()
    }
    
}
