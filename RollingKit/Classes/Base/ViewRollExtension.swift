//
//  RollingView.swift
//  RollingKit
//
//  Created by Max Deygin on 3/4/18.
//

import Foundation
import UIKit

extension UIView : PropertyStoring {
    
    public typealias T = Any
    
    private struct StoredProperties {
        static var anchorPoint = CGPoint.init(x: CGFloat.nan, y: CGFloat.nan);
        static var circularPosition = CircularCoords(angle: CGFloat.nan, radius: CGFloat.nan)
        static var startAngleOffset:CGFloat = 0.0
        
    }
    
    public var startAngleOffset : CGFloat {
        get {
            return getAssociatedObject(&StoredProperties.startAngleOffset, defaultValue: StoredProperties.startAngleOffset) as! CGFloat
        }
        set(angle) {
            setAssociatedObject(&StoredProperties.startAngleOffset, newValue:angle)
            for subview in subviews {
                subview.resetCenter()
            }
        }
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
    
    public var circularPosition: CircularCoords {
        
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
        
        
        self.center = superview!.location(from:coords)
    }
    
    func coords(from: CGPoint) -> CircularCoords {
        var coords = CircularCoords()
        let fullCircle = CGFloat.pi*2
        let catetus1 = from.x - anchorPoint.x
        let catetus2 = from.y - anchorPoint.y
        
        
        coords.radius = sqrt(catetus1 * catetus1 + catetus2*catetus2)
        coords.angle = atan(catetus2/catetus1)
        if  (catetus1 < 0){
         coords.angle += fullCircle/2
        }
        coords.angle -= startAngleOffset
        coords.angle -= fullCircle/4
        if coords.angle < 0.0 {
            coords.angle = fullCircle - (-coords.angle).truncatingRemainder(dividingBy:fullCircle)
        }
        
        return coords
    }
    func location(from: CircularCoords) -> CGPoint {
        let cosinus = cos(from.angle + startAngleOffset + CGFloat.pi/2)
        let sinus = sin(from.angle + startAngleOffset + CGFloat.pi/2)
        return CGPoint(x: anchorPoint.x + cosinus * from.radius,
                       y: anchorPoint.y + sinus * from.radius)
    }
}
