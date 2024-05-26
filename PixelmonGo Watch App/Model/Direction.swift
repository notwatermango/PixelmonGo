//
//  DirectionHelper.swift
//  PixelmonGo Watch App
//
//  Created by mg0 on 15/05/24.
//

import Foundation

internal extension Double {
    func normalizedToScale(_ max: Double) -> Double {
        return self - (max * (floor(self / max)))
    }
}

private struct Angle: ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
    var degrees: Double
    
    
    init(_ value: Double) {
        self.degrees = value
    }

    init(radians: Double) {
        self.degrees = (radians * 180.0) / .pi
    }
    
    init(floatLiteral value: Double) {
        self.degrees = value
    }
    
    init(integerLiteral value: Int) {
        self.degrees = Double(value)
    }
    
    var radians: Double {
        return (degrees * .pi) / 180.0
    }
    
    func unwound() -> Angle {
        return Angle(degrees.normalizedToScale(360))
    }
    
    func quadrantShifted() -> Angle {
        if degrees >= -180 && degrees <= 180 {
            return self
        }
        
        return Angle(degrees - (360 * (degrees/360).rounded()))
    }
}

private func +(left: Angle, right: Angle) -> Angle {
    return Angle(left.degrees + right.degrees)
}

private func -(left: Angle, right: Angle) -> Angle {
    return Angle(left.degrees - right.degrees)
}

private func *(left: Angle, right: Angle) -> Angle {
    return Angle(left.degrees * right.degrees)
}

private func /(left: Angle, right: Angle) -> Angle {
    return Angle(left.degrees / right.degrees)
}


public struct Coordinates: Codable, Equatable {
    let latitude: Double
    let longitude: Double

    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    fileprivate var latitudeAngle: Angle {
        return Angle(latitude)
    }
    
    fileprivate var longitudeAngle: Angle {
        return Angle(longitude)
    }
}

public struct Direction {
  // The heading to a destination from True North
  public let direction: Double

  public init(from origin: Coordinates, to destination: Coordinates) {
    // Equation from "Spherical Trigonometry For the use of colleges and schools" page 50
    let term1 = sin(destination.longitudeAngle.radians - origin.longitudeAngle.radians)
    let term2 = cos(origin.latitudeAngle.radians) * tan(destination.latitudeAngle.radians)
    let term3 = sin(origin.latitudeAngle.radians) * cos(destination.longitudeAngle.radians - origin.longitudeAngle.radians)

    direction = Angle(radians: atan2(term1, term2 - term3)).unwound().degrees
  }
}

public func calculateDirection(from origin: Coordinates, to destination: Coordinates) -> Direction {
  return Direction(from: origin, to: destination)
}
