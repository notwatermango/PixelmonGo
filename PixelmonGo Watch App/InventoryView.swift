//
//  InventoryView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 15/05/24.
//

import SwiftUI

struct InventoryView: View {
    @EnvironmentObject private var state: State

    @AppStorage("currentPokemon") var currentPokemon = 0
    @AppStorage("currentCaughtPokemon") var currentCaughtPokemon = -1
    var body: some View {
        NavigationStack {
            if currentCaughtPokemon == -1 {
                Text("You have nothing! Go catch some pokemon!").font(.footnote)
                    .navigationTitle("Inventory")
            } else {
                ScrollView {
                    ForEach(pixelmons) {pixelmon in
                        if pixelmon.id < currentPokemon {
                            NavigationLink(destination: PokemonDetailView(pixelmon: pixelmon).environmentObject(state)) {
                                if pixelmon.id == currentCaughtPokemon {
                                    Text("new! \(pixelmon.name)")
                                } else {
                                    Text("\(pixelmon.name)")
                                }
                            }
                            .navigationTitle("Inventory")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    InventoryView()
}
