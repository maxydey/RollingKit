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
    let radius:CGFloat = 20
    let circleRadius:CGFloat = 120
    
    @IBOutlet weak var rollOffsetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRollView()
        view.backgroundColor = UIColor.sky
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupSubviews()
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
        resetLabels()
    }
    func setupSubviews() {
        
        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: radius*2, height: radius*2)
        v.layer.cornerRadius = radius
        rollView.addSubview(v)
        
        
        v.circularPosition = CircularCoords(angle: 0.0, radius: circleRadius)
        v.backgroundColor = UIColor.grass
        v.layer.borderWidth = 2.0
        v.layer.borderColor = UIColor.violets.cgColor
        
    }
    
    func resetLabels() {
        rollOffsetLabel.text = "Roll offset: \(roundedFloatFormatter.string(from: NSNumber(value:Float(rollView.angleOffset)))!)"
    }
    
}
