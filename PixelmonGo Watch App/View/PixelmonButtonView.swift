//
//  PixelmonButtonView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 20/05/24.
//

import SwiftUI

struct PixelmonButtonView: View {
    let pixelmon: Pixelmon
    let router: Router
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationStack {
                Text("A pixelmon has appeared!").font(.footnote)
                NavigationLink(destination: PixelmonCatchView(pixelmon: pixelmon, router: router)
                               ,label: {
                    AnimatingImage(images: pixelmon.imageAnimation, width: pixelmon.computedWidth/3, height: pixelmon.computedHeight/3)
                })
                .frame(width: 60, height: 60)
            }
        }
    }
}

#Preview {
    @State var s = 1
    return PixelmonButtonView(pixelmon: pixelmons[0], router: Router())
}
