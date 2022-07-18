//
//  PokemonDetailDTO.swift
//  PokeAppLC
//
//  Created by Luciano Federico Castro on 18/07/2022.
//

import Foundation
struct PokemonDetailDTO: Codable {
    let id: Int
    let name: String
    let sprites: SpriteDTO
}
