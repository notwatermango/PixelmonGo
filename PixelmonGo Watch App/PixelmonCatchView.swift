//
//  PixelmonCatchView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 20/05/24.
//

import SwiftUI

struct PixelmonCatchView: View {
    @AppStorage("currentPage") var currentPage = 1
    @AppStorage("currentPokemon") var currentPokemon = 0
    @AppStorage("currentCaughtPokemon") var currentCaughtPokemon = -1
    let pixelmon: Pixelmon
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {

        VStack {
            Image(systemName: "trash.fill").resizable().frame(width: 90, height: 90)
            Button {
                // Update inventory
                currentCaughtPokemon = pixelmon.id
                if currentPokemon < pixelmons.count - 1 {
                    currentPokemon = pixelmon.id + 1
                }
                // Change tab to inventory
                currentPage = 2
                // Reset radarview
                dismiss()
            } label: {
                Text("Catch")
            }.frame(width: 100)
        }
    }
}

#Preview {
    PixelmonCatchView(pixelmon: pixelmons[0])
}
