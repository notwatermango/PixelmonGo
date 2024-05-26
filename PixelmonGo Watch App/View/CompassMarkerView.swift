//
//  CompassMarkerView.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 27/05/24.
//

import SwiftUI

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

#Preview {
    @ObservedObject var compassHeading = CompassHeading()
    return ZStack {
        ForEach(Marker.markers(pixelmonDegree: Double(12.4)), id: \.self) { marker in
            CompassMarkerView(marker: marker,
                              compassDegress: compassHeading.degrees)
        }
    }
    .frame(width: 150,
           height: 150)
    .rotationEffect(Angle(degrees: compassHeading.degrees))
}
