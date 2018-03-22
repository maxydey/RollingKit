//
//  RollingTypes.swift
//  FBSnapshotTestCase
//
//  Created by Max Deygin on 3/13/18.
//

import Foundation

public struct CircularCoords:Equatable {
    
    var angle:CGFloat = 0.0, radius:CGFloat = 0.0
    public init() {}
    public init(angle:CGFloat,radius:CGFloat) {
        self.angle = angle
        self.radius = radius
    }
    
    public static func == (lhs: CircularCoords, rhs: CircularCoords) -> Bool {
        return lhs.angle == rhs.angle && lhs.radius == rhs.radius
    }
    
    public static func + (lhs: CircularCoords, rhs: CircularCoords) -> CircularCoords {
        var result = lhs
        result.angle += rhs.angle
        result.radius += rhs.radius
        return result
    }
    
    public static func - (lhs: CircularCoords, rhs: CircularCoords) -> CircularCoords {
        var result = lhs
        result.angle -= rhs.angle
        result.radius -= rhs.radius
        return result
    }


}
