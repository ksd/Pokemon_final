//
//  PokemonStateController.swift
//  Pokemon_final
//
//  Created by ksd on 09/03/2022.
//

import SwiftUI

class PokemonStateController: ObservableObject {
    
    private let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=1126")
    
    @Published var pokemons: [Pokemon] = []
    
    init(){
        if let url = url {
            getPokemons(url: url)
        }
    }
    
    private func getPokemons(url: URL){
        Task{
            let data = try! await NetworkService.fetchData(from: url)
            if let data = data {
                let response = try! JSONDecoder().decode(Result.self, from: data)
                response.results.forEach { pokeUrl in
                    Task {
                        let url = URL(string: pokeUrl.url)!
                        let pokemonData = try! await NetworkService.fetchData(from: url)
                        if let data = pokemonData {
                            let pokemon = try! JSONDecoder().decode(Pokemon.self, from: data)
                            print(pokemon.sprites.other.official_artwork.front_default ?? "<TOM>")
                            DispatchQueue.main.async {
                                self.pokemons.append(pokemon)
                            }
                        }
                    }
                }
            }
        }
    }
    
}

