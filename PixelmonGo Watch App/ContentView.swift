//
//  ContentView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 15/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var viewId: Int
    var body: some View {
        TabView(selection: $viewId) {
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
    ContentView(viewId: 1)
}
