//
//  PixelmonButtonView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 20/05/24.
//

import SwiftUI

struct PixelmonButtonView: View {
    let pixelmon: Pixelmon
    var body: some View {
        ZStack(alignment: .top) {
            NavigationView {
                NavigationLink(destination: PixelmonCatchView(pixelmon: pixelmon)
                               ,label: {
                    Image(systemName: "trash")
                })
                .frame(width: 60, height: 60)
            }
            Text("A pixelmon has appeared!").font(.footnote)
        }
    }
}

#Preview {
    PixelmonButtonView(pixelmon: pixelmons[0])
}