//
//  PokemonDetailViewModel.swift
//  PokeAppLC
//
//  Created by Luciano Federico Castro on 18/07/2022.
//

import Foundation

class PokemonDetailViewModel {
    private var delegate: PokemonDetailDelegate
    private var service: PokemonDetailService
    private var pokemonURL: String
    
    init(pokemonUrl: String, service: PokemonDetailService, delegate: PokemonDetailDelegate) {
        self.pokemonURL = pokemonUrl
        self.service = service
        self.delegate = delegate
    }
    
    // Implementacion con closure
    /*
     func getPokemon(onGetPokemon: @escaping (PokemonDetailDTO) -> Void) {
     */
    func getPokemon() {
        service.getPokemon(urlPokemon: pokemonURL) { pokemon in
            self.delegate.pokemonData(data: pokemon)
            //Con closure
            /*
            onGetPokemon(pokemon)
             */
        } onError: { errorMessage in
            self.delegate.showError(error: errorMessage)
        }
    }
}
