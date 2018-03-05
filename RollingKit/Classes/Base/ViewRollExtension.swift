//
//  RollingView.swift
//  RollingKit
//
//  Created by Max Deygin on 3/4/18.
//

import Foundation
import UIKit

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
}

extension UIView : PropertyStoring {

    public typealias T = Any

    private struct StoredProperties {
        static var anchorPoint = CGPoint.init(x: CGFloat.nan, y: CGFloat.nan);
        static var circularPosition = CircularCoords(angle: CGFloat.nan, radius: CGFloat.nan)

    }
    
    public var anchorPoint : CGPoint {
        get {
            let point : CGPoint =  getAssociatedObject(&StoredProperties.anchorPoint, defaultValue: StoredProperties.anchorPoint) as! CGPoint

            // If no anchor point set - the view uses it's center as anchor point
            if point.x.isNaN || point.y.isNaN {
                return  CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
            }
            return point
        }
        set(point) {
            setAssociatedObject(&StoredProperties.anchorPoint, newValue:point)
            for subview in subviews {
                subview.resetCenter()
            }
        }
    }
    
    public var circularPosition : CircularCoords {
        
        get {
            return getAssociatedObject(&StoredProperties.circularPosition, defaultValue: StoredProperties.circularPosition) as! CircularCoords
            
        }
        set(coords) {
            setAssociatedObject(&StoredProperties.circularPosition, newValue:coords)
            resetCenter()
        }
    }
    func resetCenter() {
        if (superview == nil) {return}
        let coords = circularPosition
        if coords.angle.isNaN || coords.radius.isNaN {return}
        
        let anchor = superview!.anchorPoint
        var center = CGPoint()
        let c = cos(coords.angle + CGFloat.pi/2)
        let s = sin(coords.angle + CGFloat.pi/2)
        center.x = anchor.x + c * coords.radius
        center.y = anchor.y + s * coords.radius
        self.center = center
    }
}
