//
//  Pixelmon.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 20/05/24.
//

import Foundation

struct Pixelmon: Identifiable {
    var id: Int
    let name: String
    let imageName: String
    let description: String
}

var pixelmons = [
  Pixelmon(id: 1, name: "Sparkhop", imageName: "sparkhop", description: "This electric mouse Pixelmon crackles with energy. Its fur sparks when happy."),
  Pixelmon(id: 2,  name: "Bloomwing", imageName: "bloomwing", description: "A graceful flying Pixelmon, Bloomwing leaves a trail of flower petals in its wake."),
  Pixelmon(id: 3,  name: "Timberhorn", imageName: "timberhorn", description: "A powerful ground-type Pixelmon, Timberhorn can headbutt down entire trees."),
  Pixelmon(id: 4,  name: "Shimmerfin", imageName: "shimmerfin", description: "This water-type Pixelmon has shimmering scales that refract light, creating a mesmerizing display."),
  Pixelmon(id: 5,  name: "Whisplight", imageName: "whisplight", description:  "A ghost-type Pixelmon that resembles a wisp of smoke. It loves to play pranks by flickering lights."),
  Pixelmon(id: 6,  name:  "Emberclaw", imageName: "emberclaw", description: "This fire-type Pixelmon has claws that burn with a faint ember. It loves to chase after butterflies."),
  Pixelmon(id: 7,  name: "Rockhide", imageName: "rockhide", description: "A rock-type Pixelmon with a tough, rocky hide. It's surprisingly agile for its size."),
  Pixelmon(id: 8,  name: "Breezesprite", imageName: "breezesprite", description: "This fairy-type Pixelmon rides the wind, leaving a trail of shimmering dust."),
  Pixelmon(id: 9,  name: "Sandcrawler", imageName: "sandcrawler", description: "A ground-type Pixelmon that burrows through sand. It can camouflage itself perfectly."),
  Pixelmon(id: 10, name: "Crystalwing", imageName: "crystalwing", description: "This ice-type Pixelmon has wings made of shimmering crystal. It can create blizzards with a flap of its wings."),
]

