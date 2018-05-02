//
//  Pokemon.swift
//  PokedexLab
//
//  Created by SAMEER SURESH on 2/25/17.
//  Copyright © 2017 iOS Decal. All rights reserved.
//

import Foundation

@objc class Pokemon: NSObject {
    
    let name: String!
    let number: Int!
    let attack: Int!
    let defense: Int!
    let health: String!
    let specialAttack: String!
    let specialDefense: String!
    let species: String!
    let speed: String!
    let total: Double!
    let types: [String]
    let imageUrl: String!
    
    init(name: String, number: Int, attack: Int, defense: Int, health: String, spAttack: String, spDef: String, species: String, speed: String, total: Double, types: [String]) {
        self.name = name
        self.number = number
        self.attack = attack
        self.defense = defense
        self.health = health
        self.specialAttack = spAttack
        self.specialDefense = spDef
        self.species = species
        self.speed = speed
        self.total = total
        self.types = types
        self.imageUrl = name
    }
  
    static func ==(lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.name == rhs.name
    }
    
}

