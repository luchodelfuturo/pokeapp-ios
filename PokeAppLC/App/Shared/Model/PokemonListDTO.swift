//
//  PokemonListDTO.swift
//  PokeAppLC
//
//  Created by Luciano Federico Castro on 18/07/2022.
//

import Foundation
// DTO: Data Transfer Object
struct PokemonListDTO: Codable {
    let results: [PokemonDTO]
}
