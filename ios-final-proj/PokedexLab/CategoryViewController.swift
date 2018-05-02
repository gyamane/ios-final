//
//  CategoryViewController.swift
//  PokedexLab
//
//  Created by SAMEER SURESH on 2/25/17.
//  Copyright © 2017 iOS Decal. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var pokemonArray: [Pokemon]?
    var cachedImages: [Int:UIImage] = [:]
    var selectedIndexPath: IndexPath?
    var pokemon: Pokemon?
    
    @IBOutlet weak var pokemonTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonTableView.dataSource = self
        pokemonTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (pokemonArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonTableViewCell", for: indexPath) as? customTableViewCell {
            let pokemon = pokemonArray![indexPath.row]
            cell.pokemonImage.image = UIImage(named:pokemon.name)
            
//            if let image = cachedImages[indexPath.row] {
//                cell.pokemonImage.image = image
//            } else {
//                cell.pokemonImage.image = nil
//                let url = URL(string: pokemon.imageUrl)!
//                let session = URLSession(configuration: .default)
//                let downloadPicTask = session.dataTask(with: url) { (data, response, error) in
//                    if let e = error {
//                        print("Error downloading picture: \(e)")
//                    } else {
//                        if let _ = response as? HTTPURLResponse {
//                            if let imageData = data {
//                                let image = UIImage(data: imageData)
//                                DispatchQueue.main.async {
//                                    self.cachedImages[indexPath.row] = image
//                                    cell.pokemonImage.image = image // UIImage(data: imageData)
//                                }
//                            } else {
//                                print("Couldn't get image: Image is nil")
//                            }
//                        } else {
//                            print("Couldn't get response code")
//                        }
//                    }
//                }
//                downloadPicTask.resume()
//            }
            cell.pokemonName.text = pokemon.name
            //cell.pokemonNumber.text = String(pokemon.number)
            //cell.pokemonStats.text = String(pokemon.attack) + "/" + String(pokemon.defense) + "/" + String(pokemon.health)
            return cell
        } else {
            //error handling
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        performSegue(withIdentifier: "categoryToPokemonInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "categoryToPokemonInfo" {
            if let dest = segue.destination as? PokemonInfoViewController {
                dest.pokemon = pokemonArray?[(selectedIndexPath?.row)!]
                dest.image = cachedImages[(selectedIndexPath?.row)!]
            }
        }

    }


}
