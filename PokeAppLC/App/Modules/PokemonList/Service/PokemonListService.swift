//
//  PokemonListService.swift
//  PokeAppLC
//
//  Created by Luciano Federico Castro on 18/07/2022.
//

import Foundation
import Foundation

class PokemonListService {
    
    func getPokemons(onComplete: @escaping ([PokemonDTO]) -> Void,
                     onError: @escaping (String) -> Void) {
        
        // Llamo una funciona
        ApiManger.shared.getCall(url: Constants().pokemonListURL) { response in
            
            // Hago un switch
            switch response {
            case .success(let data):
                // Hago un do catch
                do {
                    if let data = data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = . convertFromSnakeCase
                        let pokemonResponse = try decoder.decode(PokemonListDTO.self, from: data)
                        onComplete(pokemonResponse.results)
                    }
                    
                } catch {
                    onError("fallo la conversión del json")
                }
            case .failure(_):
                onError("Fallo en el apimanager")
            }
            
        }
        
        
    }
    
}
