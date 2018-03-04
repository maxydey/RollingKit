//
//  PropertyStoringTests.swift
//  RollingKit_Example
//
//  Created by Max Deygin on 3/4/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

import Quick
import Nimble

@testable import RollingKit

class PropertyStoringTest: QuickSpec {
    override func spec() {
        describe("View Anchor point storage") {
            
            context("No anchor point") {
                let view = UIView.init(frame: CGRect(x: 100, y: 100, width: 100, height: 100))

                it("is expected to have default anchor point equals center point") {
                    
                    expect(view.anchorPoint).to(equal(CGPoint.init(x: view.frame.size.width/2, y: view.frame.size.height/2)))
                }
            }
            
            context("Anchor point set") {
                let view = UIView.init(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
                let point = CGPoint(x: 10, y: 10)
                view.anchorPoint = point
                
                it("is expected to get stored anchor point") {
                    expect(view.anchorPoint).to(equal(point))
                }
            }
        }
    }
}
