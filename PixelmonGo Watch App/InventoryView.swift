//
//  InventoryView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 15/05/24.
//

import SwiftUI

struct InventoryView: View {
    @EnvironmentObject private var state: State

    @AppStorage("currentPixelmon") var currentPixelmon = 0
    @AppStorage("currentCaughtPixelmon") var currentCaughtPixelmon = -1
    var body: some View {
        NavigationStack {
            if currentCaughtPixelmon == -1 {
                Text("You have nothing! Go catch some pixelmon!").font(.footnote)
                    .navigationTitle("Inventory")
            } else {
                ScrollView {
                    ForEach(pixelmons) {pixelmon in
                        if pixelmon.id < currentPixelmon {
                            NavigationLink(destination: PixelmonDataView(pixelmon: pixelmon).environmentObject(state)) {
                                if pixelmon.id == currentCaughtPixelmon {
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
