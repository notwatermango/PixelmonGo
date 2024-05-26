//
//  ContentView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 15/05/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("currentPixelmon") var currentPixelmonIndex = 1
    @AppStorage("currentCaughtPixelmon") var currentCaughtPixelmon = 0
    @AppStorage("selectedTab") var selectedTab = 1
    
    @StateObject private var router = Router()
    @StateObject var ingameCheatManager = IngameCheatManager()
    
    var body: some View {
        TabView(selection: $router.selectedTab) {
            FindView(router: router)
                .tabItem {
                    if !router.hideTabView {
                        Label("Radar Tab", systemImage: "")
                    }
                }
                .containerBackground(.green.gradient,
                                     for: .tabView)
                .tag(1)
                .environmentObject(ingameCheatManager)
            InventoryView()
                .tabItem {
                    if !router.hideTabView {
                        Label("Inventory Tab", systemImage: "")
                    }
                }
                .containerBackground(.blue.gradient,
                                     for: .tabView)
                .tag(2)
            if ingameCheatManager.enabled {
                NavigationView {
                    VStack {
                        Toggle(isOn: $ingameCheatManager.showPixelmon, label: {
                            Text("Pixelmon Teleport")
                        }).padding()
                    
                        Button (role:.destructive) {
                            currentPixelmonIndex = 1
                            currentCaughtPixelmon = 0
                        } label: {
                            Text("Reset pokemons")
                        }
                        .padding()
                    }.navigationTitle("Cheats")
                }
                .tabItem {
                    Label("Cheat Tab", systemImage: "")
                }
                .tag(3)
            }
        }
        .tabViewStyle(.verticalPage)
        .environmentObject(router)
    }
}



#Preview {
    ContentView()
}
