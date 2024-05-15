//
//  ContentView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 15/05/24.
//

import SwiftUI

struct ContentView: View {    
    
    var body: some View {
        TabView {
            Text("hi")
            Text("wow")
        }
        .tabViewStyle(.verticalPage)
    }
}

#Preview {
    ContentView()
}
