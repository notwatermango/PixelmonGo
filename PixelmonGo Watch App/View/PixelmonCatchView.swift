//
//  PixelmonCatchView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 20/05/24.
//

import SwiftUI

struct PixelmonCatchView: View {
    @AppStorage("currentPixelmon") var currentPixelmon = 0
    @AppStorage("currentCaughtPixelmon") var currentCaughtPixelmon = -1
    @AppStorage("selectedTab") var selectedTab = 1
    @Environment(\.dismiss) private var dismiss
    let pixelmon: Pixelmon
    let router: Router
    
    var body: some View {

        VStack {
            AnimatingImage(images: pixelmon.imageAnimation, width: pixelmon.computedWidth, height: pixelmon.computedHeight)
            Button {
                // Update inventory
                currentCaughtPixelmon = pixelmon.id
                if currentPixelmon < pixelmons.count - 1 {
                    currentPixelmon = pixelmon.id + 1
                }
                // Change tab to inventory
                selectedTab = 1
                router.selectedTab = 2
                // Reset radarview
                dismiss()
            } label: {
                Text("Catch")
            }.frame(width: 100)
        }
    }
}

#Preview {
    return PixelmonCatchView(pixelmon: pixelmons[0], router: Router())
}
