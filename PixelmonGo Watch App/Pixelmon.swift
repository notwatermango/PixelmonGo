//
//  Pixelmon.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 20/05/24.
//

import Foundation

struct Pixelmon: Identifiable {
    var id: String { name }
    let name: String
    let imageName: String
    let description: String
}

var pixelmons = [
    Pixelmon(name: "poke1", imageName: "poke1", description: "Sebuah pokemon 1"),
    Pixelmon(name: "poke2", imageName: "poke2", description: "Sebuah pokemon 2"),
    Pixelmon(name: "poke3", imageName: "poke3", description: "Sebuah pokemon 3")
]
