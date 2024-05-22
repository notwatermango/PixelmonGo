//
//  PokemonDetailView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 22/05/24.
//

import SwiftUI

struct PokemonDetailView: View {
    let pixelmon: Pixelmon
    var body: some View {
        NavigationStack {
            ScrollView {
                AnimatingImage(images: pixelmon.imageAnimation, width: 36*3, height: 30*3)
                Text(pixelmon.description)
                    .navigationTitle(pixelmon.name)
                
            }
        }
    }
}

#Preview {
    PokemonDetailView(pixelmon: pixelmons[0])
}
