//
//  PokemonListViewModel.swift
//  PokeAppLC
//
//  Created by Luciano Federico Castro on 18/07/2022.
//

import Foundation


class PokemonListViewModel {
    
    // Referencia al service
    private var service: PokemonListService
    
    // Referencia al delegate del viewcontroller
    private var delegate: PokemonListDelegate

    // Array de pokemones en el contexto del viewmodel
    private var pokemones = [PokemonDTO]()

    // Inicializador de la clase del viewmodel
    init(service: PokemonListService, delegate: PokemonListDelegate){
        self.service = service
        self.delegate = delegate
    }
    
    // Funcion principal para hacer la llamada de la api y obtener los pokemones
    func getPokemons(){
        
        service.getPokemons { pokemons in
            // Establezco el resultado de los pokemones a mi array local
            self.pokemones = pokemons
            
            // Por medio del delegate le digo que refresce la tabla
            self.delegate.reloadTable()
        } onError: { error in
            
            // Muestro un error en caso de que exista
            self.delegate.showError(error: error)
        }

    }
    
    // Obtener un pokemon en especifico en base a su indice dentro del array
    func getPokemon(at index: Int) -> PokemonDTO {
        return pokemones[index]
    }
    
    // Obtener la cantidad de pokemones
    func getPokemonsCount() -> Int {
        pokemones.count
    }
    
}
