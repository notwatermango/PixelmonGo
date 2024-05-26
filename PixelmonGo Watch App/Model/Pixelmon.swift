//
//  Pixelmon.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 20/05/24.
//

import Foundation
import CoreLocation

struct Pixelmon: Identifiable {
    var id: Int
    let name: String
    let imageName: String
    let description: String
    let location: CLLocation
    let imageAnimation: [String]
    let imageWidth: Int
    let imageHeight: Int
    
    var computedHeight: CGFloat {
        return CGFloat((100 / imageHeight) * imageHeight)
    }
    var computedWidth: CGFloat {
        return CGFloat((100 / imageHeight) * imageWidth)
    }
    
    init(id: Int, name: String, imageName: String, description: String, location: CLLocation, imageAnimation: [String], imageWidth: Int, imageHeight: Int) {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.description = description
        self.location = location
        self.imageAnimation = imageAnimation
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
    }
}
//-6.302107894052675, 106.65240718297603 around academy
//-6.302340541031211, 106.65240400071369 around academy
//-6.3021417662138735, 106.65219695908854 around academy
//-6.302059917733572, 106.65273573786406 otw breeze
//-6.301913797472432, 106.65352780525258 burgreens

//-6.3020087936269436, 106.65394401326083 sate khas senayan
//-6.301685500185822, 106.65422919282146 jitlada thai cuisine
//-6.301532280471812, 106.65358792418778 brewerkz
//-6.301417365655632, 106.65303760470924 bsdlink
//-6.3021013555038055, 106.65241909198568 around academy

var pixelmons = [
    Pixelmon(id: 1, name: "Sparkhop", imageName: "sparkhop", description: "This electric mouse Pixelmon crackles with energy. Its fur sparks when happy.", location: CLLocation(latitude: -6.302107894052675, longitude: 106.65240718297603), imageAnimation: (1...16).map {
        String(format: "pig_%d", $0)
    }, imageWidth: 6, imageHeight: 5), // 6 x 5
    Pixelmon(id: 2,  name: "Bloomwing", imageName: "bloomwing", description: "A graceful flying Pixelmon, Bloomwing leaves a trail of flower petals in its wake.", location: CLLocation(latitude: -6.302340541031211, longitude: 106.65240400071369), imageAnimation: (1...14).map {
        String(format: "chicken_%d", $0)
    }, imageWidth: 16, imageHeight: 17), // 16 x 17
    Pixelmon(id: 3,  name: "Timberhorn", imageName: "timberhorn", description: "A powerful ground-type Pixelmon, Timberhorn can headbutt down entire trees.", location: CLLocation(latitude: -6.3021417662138735, longitude: 106.65219695908854), imageAnimation: (1...6).map {
        String(format: "radish_%d", $0)
    }, imageWidth: 15, imageHeight: 19), // 15 x 19
    Pixelmon(id: 4,  name: "Shimmerfin", imageName: "shimmerfin", description: "This water-type Pixelmon has shimmering scales that refract light, creating a mesmerizing display.", location: CLLocation(latitude: -6.302059917733572, longitude: 106.65273573786406), imageAnimation: (1...10).map {
        String(format: "snail_%d", $0)
    }, imageWidth: 19, imageHeight: 12), // 19 x 12
    Pixelmon(id: 5,  name: "Rockhide", imageName: "rockhide", description: "A rock-type Pixelmon with a tough, rocky hide. It's surprisingly agile for its size.", location: CLLocation(latitude: -6.301685500185822, longitude: 106.65422919282146), imageAnimation: (1...11).map {
        String(format: "trunk_%d", $0)
    }, imageWidth: 2, imageHeight: 1), // 2 x 1
//    Pixelmon(id: 6,  name: "Whisplight", imageName: "whisplight", description:  "A ghost-type Pixelmon that resembles a wisp of smoke. It loves to play pranks by flickering lights.", location: CLLocation(latitude: -6.301913797472432, longitude: 106.65352780525258), imageAnimation: (1...7).map {
    Pixelmon(id: 6,  name: "Whisplight", imageName: "whisplight", description:  "A ghost-type Pixelmon that resembles a wisp of smoke. It loves to play pranks by flickering lights.", location: CLLocation(latitude: -6.644975531267701, longitude: 107.88541211363585), imageAnimation: (1...7).map {
        String(format: "flying_bat_%d", $0) // debug
    }, imageWidth: 23, imageHeight: 15), // 23 15
    Pixelmon(id: 7,  name:  "Emberclaw", imageName: "emberclaw", description: "This fire-type Pixelmon has claws that burn with a faint ember. It loves to chase after butterflies.", location: CLLocation(latitude: -6.3020087936269436, longitude: 106.65394401326083), imageAnimation: (1...10).map {
        String(format: "chameleon_%d", $0)
    }, imageWidth: 42, imageHeight: 19), // 42 19
    Pixelmon(id: 8,  name: "Breezesprite", imageName: "breezesprite", description: "This fairy-type Pixelmon rides the wind, leaving a trail of shimmering dust.", location: CLLocation(latitude: -6.301532280471812, longitude: 106.65358792418778), imageAnimation: (1...8).map {
        String(format: "plant_%d", $0)
    }, imageWidth: 22, imageHeight: 21), // 22 21
    Pixelmon(id: 9,  name: "Sandcrawler", imageName: "sandcrawler", description: "A ground-type Pixelmon that burrows through sand. It can camouflage itself perfectly.", location: CLLocation(latitude: -6.301417365655632, longitude: 106.65303760470924), imageAnimation: (1...14).map {
        String(format: "mushroom_%d", $0)
    }, imageWidth: 1, imageHeight: 1), // 1 1
    Pixelmon(id: 10, name: "Crystalwing", imageName: "crystalwing", description: "This ice-type Pixelmon has wings made of shimmering crystal. It can create blizzards with a flap of its wings.", location: CLLocation(latitude: -6.3021013555038055, longitude: 106.65241909198568), imageAnimation: (1...10).map {
        String(format: "ghost_%d", $0)
    }, imageWidth: 22, imageHeight: 15), // 22 15
]

