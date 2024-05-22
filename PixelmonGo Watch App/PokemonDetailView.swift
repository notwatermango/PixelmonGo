//
//  PokemonDetailView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 22/05/24.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject private var state: State

    let pixelmon: Pixelmon
    var body: some View {
        NavigationStack {
            ScrollView {
                AnimatingImage(images: pixelmon.imageAnimation, width: 36*3, height: 30*3)
                Text(pixelmon.description)
                    .navigationTitle(pixelmon.name)
                
            }
        }
        .onAppear(perform: { state.hideTabView = true })
        .onDisappear(perform: { state.hideTabView = false })
    }
}

#Preview {
    PokemonDetailView(pixelmon: pixelmons[0]).environmentObject(State())
}
