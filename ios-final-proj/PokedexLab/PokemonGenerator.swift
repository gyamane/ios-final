//
//  PokemonGenerator.swift
//  PokedexLab
//
//  Created by SAMEER SURESH on 2/25/17.
//  Copyright © 2017 iOS Decal. All rights reserved.
//

import Foundation

class PokemonGenerator {
    
    static let categoryDict: [Int:String] =
        [
            0: "Anxiety",
            1: "Appetite",
            2: "Asthma",
            3: "Cerebral",
            4: "Chronic Pain",
            5: "Creative",
            6: "Depression",
            7: "Energetic",
            8: "Euphoric",
            9: "Headaches",
            10: "Insomnia",
            11: "Muscular Tension",
            12: "Nausea",
            13: "OCD",
            14: "Seizures",
//            15: "Rock",
//            16: "Steel",
//            17: "Water"
    ]
    
    static func getPokemonArray() -> [Pokemon] {
        var pokemonArray: [Pokemon] = []
        if let path = Bundle.main.path(forResource: "pokeData", ofType: "json")
        {
            if let jsonData = NSData(contentsOfFile: path) {
                do {
                    let json = try JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers) as! [String:AnyObject]
                    for key in json.keys {
                        let pokemonData = json[key] as! [String:AnyObject]
                        let number = Int(pokemonData["#"] as! String)!
                        let attack = Int(pokemonData["Attack"] as! String)!
                        let defense = Int(pokemonData["Defense"] as! String)!
                        let hp = (pokemonData["HP"] as! String)
                        let spatk = (pokemonData["Sp. Atk"] as! String)
                        let spdef = (pokemonData["Sp. Def"] as! String)
                        let species = pokemonData["Species"] as! String
                        let speed = (pokemonData["Speed"] as! String)
                        let total = Double(pokemonData["Total"] as! String)!
                        let type = pokemonData["Type"] as! [String]
                        pokemonArray.append(Pokemon(name: key, number: number, attack: attack, defense: defense, health: hp, spAttack: spatk, spDef: spdef, species: species, speed: speed, total: total, types: type))
                    }
                } catch {
                    NSLog("Could not load Pokemon array")
                }
                
            }
        }
        return pokemonArray
    }
    
    
}
