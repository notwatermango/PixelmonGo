//
//  FindView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 15/05/24.
//

import Foundation
import SwiftUI
import CoreLocationUI


struct Marker: Hashable {
    let degrees: Double
    let label: String
    
    init(degrees: Double, label: String = "") {
        self.degrees = degrees
        self.label = label
    }
    
    func degreeText() -> String {
        return String(format: "%.0f", self.degrees)
    }
    
    static func markers(pixelmonDegree: Double) -> [Marker] {
        return [
            Marker(degrees: 0),
            Marker(degrees: 30),
            Marker(degrees: 60),
            Marker(degrees: 90),
            Marker(degrees: 120),
            Marker(degrees: 150),
            Marker(degrees: 180),
            Marker(degrees: 210),
            Marker(degrees: 240),
            Marker(degrees: 270),
            Marker(degrees: 300),
            Marker(degrees: 330),
            Marker(degrees: pixelmonDegree, label: "P")
        ]
    }
}

struct CompassMarkerView: View {
    let marker: Marker
    let compassDegress: Double
    
    var body: some View {
        VStack {
            Capsule()
                .frame(width: self.capsuleWidth(),
                       height: self.capsuleHeight())
                .foregroundColor(self.capsuleColor())
                .padding(.bottom, 0)
            
            Text(marker.label)
                .fontWeight(.bold)
                .rotationEffect(self.textAngle())
                .padding(.bottom, 100)
        }.rotationEffect(Angle(degrees: marker.degrees))
    }
    
    private func capsuleWidth() -> CGFloat {
        return self.marker.label == "P" ? 3 : 1
    }
    
    private func capsuleHeight() -> CGFloat {
        return self.marker.label == "P" ? 30 : self.marker.degrees.truncatingRemainder(dividingBy: 90) == 0 ? 20: 10
    }
    
    private func capsuleColor() -> Color {
        return self.marker.label == "P" ? .red : .gray
    }
    
    private func textAngle() -> Angle {
        return Angle(degrees: -self.compassDegress - self.marker.degrees)
    }
}

class IngameCheatManager: ObservableObject {
    @Published var showPixelmon = false;
    @Published var enabled = true;
    
    func toggleShowPixelmon() {
        showPixelmon.toggle()
    }
}

struct FindView: View {
    @ObservedObject var ingameCheatManager = IngameCheatManager()
    @ObservedObject var compassHeading = CompassHeading()
    @ObservedObject var locationManager = LocationManager()
    @AppStorage("currentPixelmon") var currentPixelmon = 1
    let router: Router
    
    var body: some View {
        VStack {
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
                            Text(String(format:"Get closer! %.1fm", pmDegree))
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
                    if ingameCheatManager.enabled {
                        VStack(){
                            Spacer()
                            HStack{
                                Spacer()
                                Button {
                                    ingameCheatManager.toggleShowPixelmon()
                                } label: {
                                    if ingameCheatManager.showPixelmon {
                                        Image(systemName:"figure.run")
                                    } else {
                                        Image(systemName:"figure.run")
                                    }
                                }.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).frame(width: 30)
                            }
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

#Preview {
    @State var s = 1
    return FindView(router: Router())
}
