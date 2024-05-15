//
//  InventoryView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 15/05/24.
//

import SwiftUI

struct InventoryView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                NavigationLink(destination: NestedItemB()) {
                    Text(">")
                }
                .navigationTitle("Inventory")
                NavigationLink(destination: NestedItemB()) {
                    Text(">")
                }
                .navigationTitle("Inventory")
                NavigationLink(destination: NestedItemB()) {
                    Text(">")
                }
                .navigationTitle("Inventory")
                NavigationLink(destination: NestedItemB()) {
                    Text(">")
                }
                .navigationTitle("Inventory")
            }
        }
    }
}

struct NestedItemB: View {
    var body: some View {
        NavigationStack {
            Text("Planet spin good")
                .navigationTitle("Nested planet")
        }
    }
}

#Preview {
    InventoryView()
}
