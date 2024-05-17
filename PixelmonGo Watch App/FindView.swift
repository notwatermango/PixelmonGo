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
            //                        Text(marker.degreeText())
            //                            .fontWeight(.light)
            //                            .rotationEffect(self.textAngle())
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

struct FindView: View {
    @ObservedObject var compassHeading = CompassHeading()
//    @State var pixelmonDegree = 40
    @ObservedObject var locationManager = LocationManager()

    var body: some View {
        VStack {
            if let myLocation = locationManager.location {
                let pmDegree = Direction(from: Coordinates(latitude: myLocation.latitude, longitude: myLocation.longitude), to: Coordinates(latitude: -6.302107894052675, longitude: 106.65240718297603)).direction
                
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
            } else {
                LocationButton {
                    locationManager.startUpdatingLocation()
                }
                .labelStyle(.iconOnly)
                .cornerRadius(20)
            }
        }

        //        NavigationStack {
        //            Text("No nearby pixelmons. Use radar to get direction to a pixelmon.")
        //                .font(.footnote)
        //                .toolbar {
        //                    ToolbarItemGroup(placement: .bottomBar) {
        //                        Button {
        //                            // Click to show temporary radar
        //                        } label: {
        //                            Image(systemName:"location.magnifyingglass")
        //                        }
        //                        .controlSize(.large)
        //                        .background(in: Capsule())
        //                    }
        //                }
        //        }
    }
}

#Preview {
    FindView()
}
