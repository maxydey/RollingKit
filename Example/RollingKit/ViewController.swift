//
//  ViewController.swift
//  RollingKit
//
//  Created by Max on 03/04/2018.
//  Copyright (c) 2018 Max. All rights reserved.
//

import UIKit
import RollingKit

class ViewController: UIViewController {

    let circleView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.grass
        self.setupCircleView()
    }

    func setupCircleView() {
        
        let radius = view.frame.size.width*0.8/2
        circleView.frame = CGRect(x: (view.frame.size.width - radius*2)/2,
                                  y: (view.frame.size.height - radius*2)/2,
                                  width: radius*2,
                                  height: radius*2)
        circleView.layer.cornerRadius = radius
        circleView.layer.masksToBounds = true
        circleView.backgroundColor = UIColor.white
        
        view.addSubview(circleView)
    }
    func setupSubviews() {
        let views = [UIView(),UIView(),UIView(),UIView(),UIView()]
        for v in views {
            v.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            circleView.addSubview(v)
            
        }
    }
}

