//
//  GestureViewController.swift
//  RollingKit_Example
//
//  Created by Max Deygin on 3/22/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import RollingKit

class GestureViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let circleView = UIView()

    @IBOutlet weak var stateLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupCircleView()
    }
    
    
    func setupCircleView() {
        
        let radius:CGFloat = 160.0
        circleView.frame = CGRect(x: (view.frame.size.width - radius*2)/2,
                                  y: (view.frame.size.height - radius*2)/2,
                                  width: radius*2,
                                  height: radius*2)
        circleView.layer.cornerRadius = radius
        circleView.layer.masksToBounds = true
        circleView.backgroundColor = UIColor.white
        view.addSubview(circleView)
        let gesture =  RollingGestureRecognizer(target:self, action: #selector(GestureViewController.gestureUpdate(sender:)))
        circleView.addGestureRecognizer(gesture)
        
    }
    
    @objc func gestureUpdate(sender:UIGestureRecognizer) {
        
        guard let gesture = sender as? RollingGestureRecognizer else { return }
        print(gesture.velosity)
        
    }

}
