//
//  Pokemon_finalApp.swift
//  Pokemon_final
//
//  Created by ksd on 09/03/2022.
//

import SwiftUI

@main
struct Pokemon_finalApp: App {
    @State private var appState = PokemonStateController()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(appState)
        }
    }
}
