//
//  TableViewController.swift
//  CocktailRecepies
//
//  Created by Яна Иноземцева on 12.04.2022.
//

import UIKit

class TableViewController: UITableViewController {
    var cocktails: [Cocktail] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 150
        fetchCocktailReceipt()

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        cocktails.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "cocktail", for: indexPath) as? MargaritaCell
        else {

        return UITableViewCell()
    }
        let cocktails = cocktails[indexPath.row]
        cell.configure(with: cocktails)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cocktails = cocktails[indexPath.row]
        performSegue(withIdentifier: "toTheRecipe", sender: cocktails)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedCocktailVC = segue.destination as? DetailedInformation else { return }
        selectedCocktailVC.cocktail = sender as? Cocktail
        
    }
    
}

extension TableViewController {
    func fetchCocktailReceipt() {
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let cocktails = try JSONDecoder().decode(Drink.self, from: data)
                self.cocktails = cocktails.drinks
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
