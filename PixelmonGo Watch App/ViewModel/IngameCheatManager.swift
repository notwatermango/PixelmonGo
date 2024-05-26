//
//  IngameCheatManager.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 27/05/24.
//

import Foundation

class IngameCheatManager: ObservableObject {
    @Published var enabled = true;
    @Published var showPixelmon = false;
    
    func toggleShowPixelmon() {
        showPixelmon.toggle()
    }
}
