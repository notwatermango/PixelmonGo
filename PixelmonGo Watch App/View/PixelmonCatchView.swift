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
    @State var caught = false
    @State var catching = false
    
    var body: some View {
        VStack {
            AnimatingImage(images: pixelmon.imageAnimation, width: pixelmon.computedWidth, height: pixelmon.computedHeight)
            if catching {
                Text("Catching a wild \(pixelmon.name)...").font(.footnote)
            }
            else if caught {
                Text("\(pixelmon.name) has been caught!").font(.footnote)
                Button {
                    // Update Pixelmon data
                    currentCaughtPixelmon = pixelmon.id
                    currentPixelmon = pixelmon.id + 1
                    // Change tab to inventory
                    selectedTab = 2
                    router.selectedTab = 2
                    // Reset radarview
                    dismiss()
                } label: {
                    Text("Return")
                }
            } else {
                Button {
                    // Update inventory
                    catching = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        catching = false
                        caught = true
                    }
                } label: {
                    Text("Catch")
                }.frame(width: 100)
            }
        }
    }
}

#Preview {
    return PixelmonCatchView(pixelmon: pixelmons[0], router: Router())
}
