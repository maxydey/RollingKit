//
//  RollView.swift
//  RollingKit
//
//  Created by Max Deygin on 3/7/18.
//

import Foundation
import UIKit

public class RollView: UIView {
    
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
        
        self.layer.delegate = self
        
    }
    
    public var angleOffset:CGFloat = 0.0
    
    override public func didAddSubview(_ subview: UIView) {
        
    }
    
    
    
}
