//
//  ContentView.swift
//  Pokemon_final
//
//  Created by ksd on 09/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var stateController: PokemonStateController
    private var pokemons: [Pokemon] {
        stateController.pokemons.sorted{$0.id < $1.id}
    }
    
    var body: some View {
        NavigationView {
            List(pokemons) { pokemon in
                NavigationLink(destination: Text("\(pokemon.name)")) {
                    RowFor(pokemon: pokemon)
                        .padding()
                }
            }
            .navigationTitle("Pokèmons")
        }
    }
}

struct RowFor: View {
    let pokemon: Pokemon
    var body: some View {
        HStack {
            if let url = pokemon.sprites.other.official_artwork.front_default {
                AsyncImage(url: URL(string: url)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 80, height: 80)
            }
            Text("\(pokemon.name)")
                .font(.title2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(PokemonStateController())
    }
}
