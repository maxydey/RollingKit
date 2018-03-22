//
//  RollingGestureRecognizer.swift
//  FBSnapshotTestCase
//
//  Created by Max Deygin on 3/13/18.
//

import Foundation
import UIKit
import UIKit.UIGestureRecognizerSubclass

//public protocol RollingGestureRecognizerDelegate:UIGestureRecognizerDelegate {
//
//}

open class RollingGestureRecognizer: UIPanGestureRecognizer {
    
    // calculated gesture speed. radians/second for angle, positive if rolling is clockwize. and pt/seconc for radius.
    open var velosity = CircularCoords(angle:0,radius:0)
    var translation = CircularCoords(angle:0,radius:0)
    var startCoords = CircularCoords(angle:0,radius:0)
    var lastCoords = CircularCoords(angle:0,radius:0)

    var lastUpdateTime = Date(timeIntervalSince1970:0)


    open func translation(in view: UIView?) -> CircularCoords {
        
        return CircularCoords(angle:0, radius:0)
    }
    
    override open func touchesMoved(_ touches: Set<UITouch>,
                                    with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        updateIndicators()
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent) {
            super.touchesBegan(touches, with: event)
        updateIndicators()
    }
    override open func touchesEnded(_ touches: Set<UITouch>,
                                    with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        updateIndicators()
    }
    
    override open func reset() {
        velosity = CircularCoords(angle:0,radius:0)
        translation = CircularCoords(angle:0,radius:0)
        startCoords = CircularCoords(angle:0,radius:0)
        lastUpdateTime = Date(timeIntervalSince1970:0)

    }
    
    func updateIndicators() {
        
        guard let view = view else { return }
        
        let anchor = view.anchorPoint
        let currentLocation = location(in:view)
        let coords = view.coords(from:currentLocation)
        let time = Date()
        
        var translationSinceLast = CircularCoords(angle:0,radius:0)

        if lastUpdateTime.timeIntervalSince1970 > 1.0 {
            
            let interval = time.timeIntervalSince(lastUpdateTime)
          
            translationSinceLast = coords - lastCoords
            
            let fullCircle = CGFloat.pi*2
            if translationSinceLast.angle > fullCircle {
                translationSinceLast.angle = translationSinceLast.angle.truncatingRemainder(dividingBy:fullCircle)
            }
            if translationSinceLast.angle < -fullCircle {
                translationSinceLast.angle = translationSinceLast.angle.truncatingRemainder(dividingBy:-fullCircle)
            }
            if translationSinceLast.angle > fullCircle/2 {
                translationSinceLast.angle =  translationSinceLast.angle - fullCircle
            }
            if translationSinceLast.angle < -fullCircle/2 {
                translationSinceLast.angle =  translationSinceLast.angle + fullCircle
            }
            var currentVelosity = CircularCoords(angle:0,radius:0)

        }
        
        translation = translationSinceLast
        lastCoords = coords
        lastUpdateTime = time
        
    }
    
}
