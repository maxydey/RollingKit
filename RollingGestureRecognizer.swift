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

open class RollingGestureRecognizer: UIGestureRecognizer {
    
    // calculated gesture speed. radians/second for angle, positive if rolling is clockwize. and pt/seconc for radius.
    var velosity = CircularCoords(angle:0,radius:0)
    var translation = CircularCoords(angle:0,radius:0)
    var startCoords = CircularCoords(angle:0,radius:0)
    
//    weak var rollingDelegate: RollingGestureRecognizerDelegate?
//
//    override open weak var delegate:UIGestureRecognizerDelegate?{
//        get {
//            return rollingDelegate
//        }
//        set(value) {
//            if value is RollingGestureRecognizerDelegate {
//                rollingDelegate = value as! RollingGestureRecognizerDelegate
//            } else {
//                print("RollingGestureRecognizer delegate should confirm to RollingGestureRecognizerDelegate")
//            }
//        }
//    }

    open func translation(in view: UIView?) -> CircularCoords {
        
        return CircularCoords(angle:0, radius:0)
    }
    
    override open func touchesMoved(_ touches: Set<UITouch>,
                                    with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        if state == .failed || state == .cancelled {
            return
        }
        
        
        state = .changed
    }
    //states machine
    
    
    override open func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent) {
        if view != nil && touches.count > 0 {
            let touch = touches.first
            let anchor = view!.anchorPoint
            let location = touch!.location(in:view!)
            
            super.touchesBegan(touches, with: event)
            state = .began
        }
    }
    override open func touchesEnded(_ touches: Set<UITouch>,
                                    with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        state = .ended
    }
    
    override open func reset() {
    
    }
    
}
