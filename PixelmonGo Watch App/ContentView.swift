//
//  ContentView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 15/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FindView()
                .tabItem {
                    Label("Airplane Tab", systemImage: "airplane.circle")
                }
                .containerBackground(.green.gradient,
                                     for: .tabView)
            InventoryView()
                .tabItem {
                    Label("Planet Tab", systemImage: "globe.americas.fill")
                }
                .containerBackground(.blue.gradient,
                                     for: .tabView)
        }
        .tabViewStyle(.verticalPage)
    }
}

#Preview {
    ContentView()
}
