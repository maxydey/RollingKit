//
//  RollingView.swift
//  RollingKit
//
//  Created by Max Deygin on 3/4/18.
//

import Foundation
import UIKit

struct CircularCoords {
    var angle = 0.0, radius = 0.0
}

extension UIView : PropertyStoring {

    public typealias T = CGPoint

    private struct StoredProperties {
        static var anchorPoint = CGPoint.init(x: CGFloat.nan, y: CGFloat.nan);
        
    }
//    Not implemented
    
    var anchorPoint : CGPoint {
        get {
            let point : CGPoint =  getAssociatedObject(&StoredProperties.anchorPoint, defaultValue: StoredProperties.anchorPoint)

            // If no anchor point set - the view uses it's center as anchor point
            if point.x.isNaN || point.y.isNaN {
                return  CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
            }
            return point
        }
        set(point) {
            setAssociatedObject(&StoredProperties.anchorPoint, newValue:point)
        }
    }
    
    var circularPosition : CircularCoords {
        
        get {
            return CircularCoords(angle: 0.0, radius: 0.0)
        }
    }
}

