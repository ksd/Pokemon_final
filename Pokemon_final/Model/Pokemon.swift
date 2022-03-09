//
//  Pokemon.swift
//  Pokemon_final
//
//  Created by ksd on 09/03/2022.
//

import Foundation


struct Result: Decodable {
    let results: [PokeURL]
    
    struct PokeURL: Decodable {
        let url: String
    }
}


struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let sprites: Sprites
    
    
    struct Sprites: Decodable {
        let other: Other
        
        struct Other: Decodable {
            let official_artwork: Front
            
            enum CodingKeys: String, CodingKey {
                case official_artwork = "official-artwork"
            }
            
            struct Front:Decodable {
                let front_default: String?
            }
        }
    }
}
