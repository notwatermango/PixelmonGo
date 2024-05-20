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
                ForEach(pixelmons) {pixelmon in
                    NavigationLink(destination: NestedItemB(pixelmon: pixelmon)) {
                        Text(">")
                    }
                    .navigationTitle("Inventory")
                }
            }
        }
    }
}

struct NestedItemB: View {
    let pixelmon: Pixelmon
    var body: some View {
        NavigationStack {
            Text(pixelmon.description)
                .navigationTitle(pixelmon.name)
        }
    }
}

#Preview {
    InventoryView()
}
