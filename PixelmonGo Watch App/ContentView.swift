//
//  ContentView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 15/05/24.
//

import SwiftUI

class State: ObservableObject {
    @Published var hideTabView: Bool = false
}

struct ContentView: View {
    @AppStorage("currentPage") var currentPage = 1
    @AppStorage("currentPixelmon") var currentPixelmonIndex = 0
    @AppStorage("currentCaughtPixelmon") var currentCaughtPixelmon = -1
    
    @StateObject private var state = State()
    
    var body: some View {
        TabView(selection: $currentPage) {
            FindView()
                .tabItem {
                    if !state.hideTabView {
                        Label("Radar Tab", systemImage: "")
                    }
                }
                .containerBackground(.green.gradient,
                                     for: .tabView)
                .tag(1)
            InventoryView()
                .tabItem {
                    if !state.hideTabView {
                        Label("Inventory Tab", systemImage: "")
                    }
                }
                .containerBackground(.blue.gradient,
                                     for: .tabView)
                .tag(2)
        }
        .tabViewStyle(.verticalPage)
        .environmentObject(state)
    }
}



#Preview {
    ContentView()
}
