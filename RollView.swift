//
//  RollView.swift
//  RollingKit
//
//  Created by Max Deygin on 3/7/18.
//

import Foundation
import UIKit

public protocol RollViewDelegate:AnyObject {
    func rollViewDidRoll(rollView:RollView)
    
}


open class RollView: UIView,UIGestureRecognizerDelegate {
    
    public weak var delegate:RollViewDelegate?
    let gestureRecognizer = RollingGestureRecognizer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        doInit()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func doInit() {
        setupLayer()
    setupGestureRecognizer()
        
    }
    
    func setupLayer() {
        layer.delegate = self
    }
    func setupGestureRecognizer() {
        gestureRecognizer.delegate = self
    }
    
    
    public var angleOffset:CGFloat = 0.0
    
    override open func didAddSubview(_ subview: UIView) {
        
    }
}
