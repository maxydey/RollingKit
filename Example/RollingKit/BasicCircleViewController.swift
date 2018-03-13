//
//  ViewController.swift
//  RollingKit
//
//  Created by Max on 03/04/2018.
//  Copyright (c) 2018 Max. All rights reserved.
//

import UIKit
import RollingKit
import Foundation
import CoreGraphics
class BasicCircleViewController: UIViewController {
    
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var itemsNumberLabel: UILabel!
    @IBOutlet weak var itemsRadiusLabel: UILabel!
    @IBOutlet weak var circleRadiusLabel: UILabel!
    
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var stepSlider: UISlider!
    @IBOutlet weak var itemRadiusSlider: UISlider!
    @IBOutlet weak var circleRadiusSlider: UISlider!
    
    
    var numberOfItems = 12 {
        didSet {
            setupSubviews()
        }
    }
    var angleStep:CGFloat = 30.0 {
        didSet {
            setupSubviews()
        }
    }

    var circleRadius:CGFloat = 120 {
        didSet {
            setupSubviews()
        }
    }
    
    var itemRadius:CGFloat = 20.0 {
        didSet {
            setupSubviews()
        }
    }
    
    var views:[UIView] = []
    
    let circleView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.grass
        setupSliders()

     
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupCircleView()
        setupSubviews()
        
    }
    
    override func viewWillLayoutSubviews() {
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

    }
    
    func setupSubviews() {
        setupLabelsText()
        for v in views {
            v.removeFromSuperview()
        }
        var array:[UIView] = []
        
        for _ in 1...numberOfItems {
            array.append(UIView())
        }
            views = array
        
        for (i,v) in views.enumerated() {
            let radius = itemRadius
            v.frame = CGRect(x: 0, y: 0, width: radius*2, height: radius*2)
            v.layer.cornerRadius = radius
            circleView.addSubview(v)
            v.layer.zPosition = CGFloat(i)
            
            v.circularPosition = CircularCoords(angle: angleStep.toRadians * CGFloat(i), radius: circleRadius)
            v.backgroundColor = UIColor.grass
            v.layer.borderWidth = 2.0
            v.layer.borderColor = UIColor.violets.cgColor
        }
    }
    

    @IBAction func numberChanged(_ sender: Any) {
            numberOfItems = Int(numberSlider.value.rounded())
    }
    @IBAction func angleChanged(_ sender: Any) {
        angleStep = CGFloat(stepSlider.value)
    }
    @IBAction func itemRadiusChanged(_ sender: Any) {
        itemRadius = CGFloat(itemRadiusSlider.value)
    }
    @IBAction func circleRadiusChanged(_ sender: Any) {
           circleRadius = CGFloat(circleRadiusSlider.value)
    }
    
    func setupSliders() {
        numberSlider.minimumValue = 1
        numberSlider.maximumValue = 12
        numberSlider.value = Float(numberOfItems)
        
        stepSlider.minimumValue = 10
        stepSlider.maximumValue = 90
        stepSlider.value = Float(angleStep)
        
        itemRadiusSlider.minimumValue = 4
        itemRadiusSlider.maximumValue = 60
        itemRadiusSlider.value = Float(itemRadius)
        
        circleRadiusSlider.minimumValue = 0
        circleRadiusSlider.maximumValue = 160
        circleRadiusSlider.value = Float(circleRadius)
    }
    
    
    lazy var formatter : NumberFormatter  = {
        let frm = NumberFormatter()
        frm.minimumFractionDigits = 0
        frm.maximumFractionDigits = 0
        return frm
    }()
    
    func setupLabelsText() {
        
        stepLabel.text = "Offset angle: \(formatter.string(from:NSNumber(value:Float(angleStep)))!)˚"
        itemsNumberLabel.text = "Count: \(numberOfItems)"
        
        
        itemsRadiusLabel.text = "Radius: \(formatter.string(from:NSNumber(value:Float(itemRadius)))!)"
        circleRadiusLabel.text = "Center distance: \(formatter.string(from:NSNumber(value:Float(circleRadius)))!)"

    }
    
}


