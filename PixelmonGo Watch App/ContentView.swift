//
//  ContentView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 15/05/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("currentPage") var currentPage = 1
    @AppStorage("currentPokemon") var currentPokemonIndex = 0
    @AppStorage("currentCaughtPokemon") var currentCaughtPokemon = -1
    
    var body: some View {
        TabView(selection: $currentPage) {
            FindView()
                .tabItem {
                    Label("Radar Tab", systemImage: "airplane.circle")
                }
                .containerBackground(.green.gradient,
                                     for: .tabView)
                .tag(1)
            InventoryView()
                .tabItem {
                    Label("Inventory Tab", systemImage: "globe.americas.fill")
                }
                .containerBackground(.blue.gradient,
                                     for: .tabView)
                .tag(2)
        }
        .tabViewStyle(.verticalPage)
    }
}



#Preview {
    ContentView()
}
