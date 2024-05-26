//
//  FindView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 15/05/24.
//

import Foundation
import SwiftUI
import CoreLocationUI

struct FindView: View {
    @EnvironmentObject var ingameCheatManager: IngameCheatManager
    @ObservedObject var compassHeading = CompassHeading()
    @ObservedObject var locationManager = LocationManager()
    @AppStorage("currentPixelmon") var currentPixelmon = 1
    let router: Router
    
    var body: some View {
        VStack {
            if currentPixelmon > pixelmons.count {
                Text("Wow! You have collected all Pixelmons!").font(.footnote)
            } else {
                
                
                if let myLocation = locationManager.location {
                    let pixelmon = pixelmons[currentPixelmon-1]
                    let pixelmonLocation = pixelmon.location
                    let pmDegree = calculateDirection(from: Coordinates(latitude: myLocation.latitude, longitude: myLocation.longitude), to: Coordinates(latitude: pixelmonLocation.coordinate.latitude, longitude: pixelmonLocation.coordinate.longitude)).direction
                    
                    let myLocationObj = CLLocation(latitude: myLocation.latitude, longitude: myLocation.longitude)
                    let targetLocationObj = pixelmonLocation
                    let distance = myLocationObj.distance(from: targetLocationObj) // meter
                    ZStack (alignment: .center) {
                        let distanceToCatchPixelmon = 20 // meter
                        if distance < Double(distanceToCatchPixelmon) || ingameCheatManager.showPixelmon {
                            PixelmonButtonView(pixelmon: pixelmon, router: router)
                                .onAppear {
                                    WKInterfaceDevice.current().play(.start)
                                }
                        } else {
                            VStack {
                                Text(String(format:"Get closer! %.1fm", distance))
                                Capsule()
                                    .frame(width: 2,
                                           height: 30)
                                ZStack {
                                    ForEach(Marker.markers(pixelmonDegree: Double(pmDegree)), id: \.self) { marker in
                                        CompassMarkerView(marker: marker,
                                                          compassDegress: self.compassHeading.degrees)
                                    }
                                }
                                .frame(width: 150,
                                       height: 150)
                                .rotationEffect(Angle(degrees: self.compassHeading.degrees))
                            }
                        }
                    }
                }
                else {
                    Text("Start Catching Pixelmon").font(.footnote)
                    LocationButton {
                        locationManager.startUpdatingLocation()
                    }
                    .labelStyle(.iconOnly)
                    .cornerRadius(20)
                }
            }
        }
    }
}

#Preview {
    @State var s = 1
    return FindView(router: Router())
}
