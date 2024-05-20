//
//  PixelmonCatchView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 20/05/24.
//

import SwiftUI

struct PixelmonCatchView: View {
    let pixelmon: Pixelmon
    var body: some View {
        VStack {
            Image(systemName: "trash.fill").resizable().frame(width: 90, height: 90)
            Button {
                // Cycle next pixelmon
                // Update inventory
                // Change tab to inventory
            } label: {
                Text("Catch")
            }.frame(width: 100)
        }
    }
}

#Preview {
    PixelmonCatchView(pixelmon: pixelmons[0])
}
