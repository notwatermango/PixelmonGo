//
//  AnimatingImage.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 22/05/24.
//

import SwiftUI

struct AnimatingImage: View {
    let images: [String]
    let width: CGFloat
    let height: CGFloat

    @ObservedObject private var counter = Counter(interval: 0.05)
        
    var body: some View {
        Image(images[counter.value % images.count]).resizable().frame(width: width, height: height)
    }
}

private class Counter: ObservableObject {
    private var timer: Timer?

    @Published var value: Int = 0
    
    init(interval: Double) {
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in self.value += 1 }
    }
}
