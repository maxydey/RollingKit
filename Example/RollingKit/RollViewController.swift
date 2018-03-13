//
//  RollViewController.swift
//  RollingKit_Example
//
//  Created by Max Deygin on 3/13/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import RollingKit

class RollViewController: UIViewController {
    
    let rollView = RollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRollView()
    }
    
    func setupRollView() {
        
        let radius:CGFloat = 160.0
        rollView.frame = CGRect(x: (view.frame.size.width - radius*2)/2,
                                  y: (view.frame.size.height - radius*2)/2,
                                  width: radius*2,
                                  height: radius*2)
        rollView.layer.cornerRadius = radius
        rollView.layer.masksToBounds = true
        rollView.backgroundColor = UIColor.white
        view.addSubview(rollView)
    }
    
    
}
