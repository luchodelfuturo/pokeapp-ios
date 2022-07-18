//
//  PokemonSpriteDTO.swift
//  PokeAppLC
//
//  Created by Luciano Federico Castro on 18/07/2022.
//

import Foundation

struct SpriteDTO: Codable {
    let other: SprintOther?
}

struct SprintOther: Codable {
    let home: SpritHome?
}

struct SpritHome: Codable {
    let frontDefault: String?
}
