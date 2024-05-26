//
//  ContentView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 15/05/24.
//

import SwiftUI

class Router: ObservableObject {
    @Published var hideTabView: Bool = false
    @Published var selectedTab: Int = 1
}

struct ContentView: View {
    @AppStorage("currentPixelmon") var currentPixelmonIndex = 0
    @AppStorage("currentCaughtPixelmon") var currentCaughtPixelmon = -1
    @AppStorage("selectedTab") var selectedTab = 1

    @StateObject private var router = Router()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FindView(router: router)
                .tabItem {
                    if !router.hideTabView {
                        Label("Radar Tab", systemImage: "")
                    }
                }
                .containerBackground(.green.gradient,
                                     for: .tabView)
                .tag(1)
            InventoryView()
                .tabItem {
                    if !router.hideTabView {
                        Label("Inventory Tab", systemImage: "")
                    }
                }
                .containerBackground(.blue.gradient,
                                     for: .tabView)
                .tag(2)
        }
        .tabViewStyle(.verticalPage)
        .environmentObject(router)
    }
}



#Preview {
    ContentView()
}
