//
//  PixelmonCatchView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 20/05/24.
//

import SwiftUI

struct PixelmonCatchView: View {
    @AppStorage("currentPage") var currentPage = 1
    @AppStorage("currentPixelmon") var currentPixelmon = 0
    @AppStorage("currentCaughtPixelmon") var currentCaughtPixelmon = -1
    let pixelmon: Pixelmon
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {

        VStack {
            AnimatingImage(images: pixelmon.imageAnimation, width: pixelmon.computedWidth, height: pixelmon.computedHeight)
            Button {
                // Update inventory
                currentCaughtPixelmon = pixelmon.id
                if currentPixelmon < pixelmons.count - 1 {
                    currentPixelmon = pixelmon.id + 1
                }
                // Reset radarview
                dismiss()
                // Change tab to inventory
                currentPage = 2
            } label: {
                Text("Catch")
            }.frame(width: 100)
        }
    }
}

#Preview {
    PixelmonCatchView(pixelmon: pixelmons[0])
}
