//
//  PixelmonDetailView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 22/05/24.
//

import SwiftUI

struct PixelmonDataView: View {
    @EnvironmentObject private var router: Router
    let pixelmon: Pixelmon
    
    var body: some View {
        NavigationStack {
            ScrollView {
                AnimatingImage(images: pixelmon.imageAnimation, width: pixelmon.computedWidth, height: pixelmon.computedHeight)
                Text(pixelmon.description)
                    .navigationTitle(pixelmon.name)
            }
        }
        .onAppear(perform: { router.hideTabView = true })
        .onDisappear(perform: { router.hideTabView = false })
    }
}

#Preview {
    PixelmonDataView(pixelmon: pixelmons[0]).environmentObject(Router())
}
