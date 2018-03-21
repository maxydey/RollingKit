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

class ViewAnchorPointTests: QuickSpec {
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

class ViewCircularCoordinatesTests: QuickSpec {
    override func spec() {
        describe("View Circular Coordinates test") {
            context("Storage") {

                let superView = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                let view = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
                superView.addSubview(view)
                let coords = CircularCoords(angle: CGFloat.pi/2, radius: 30)
                view.circularPosition = coords;
                
                it("is expected to get what you have set") {
                    expect(coords).to(equal(coords))
                }
            }
            context("ResetCoordinates") {
                let view = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
                let superView = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                let coords = CircularCoords(angle: CGFloat.pi/2, radius: 30)

                it("no crash if no superview") {
                    view.circularPosition = coords;
                }
                it("no crash if no coordinates set") {
                    superView.addSubview(view);
                }
            }
            context("ResetAnchor") {
                let superView = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                let view = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
                superView.addSubview(view)
                let coords = CircularCoords(angle: 0, radius: 30)
                view.circularPosition = coords
                superView.anchorPoint = CGPoint(x: 70, y: 70)
                it("should reset subview coordinates when superview anchor is reset") {
                    expect(view.center).to(equal(CGPoint(x: 70, y: 100)))
                }
            }
            context("custom angle") {
                
                let superView = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                let view = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
                superView.addSubview(view)
                let coords = CircularCoords(angle: 0, radius: 30)
                view.circularPosition = coords
                
                let angle = CGFloat(90.toRadians)
                superView.startAngleOffset = angle

                it("should reset subview coordinates when superview anchor is reset") {
                    expect([Double(view.center.x),Double(view.center.y)]).to(beCloseTo([20.0, 50.0], within:0.1))
                }
            }
        }
    }
}

class CoordsConversionsTests: QuickSpec {
    override func spec() {
        describe("Convert coordinates to point and back") {
            context("to coords") {
                let view = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                let point = CGPoint(x:100, y:50)
                let coords = view.coords(from:point)
                
                it("should convert point to CircularCoords") {
                    expect([Double(coords.angle).fromRadians,Double(coords.radius)]).to(beCloseTo([270.0,50.0], within: 1.0))
                }
            }
            context("to coords 2") {
                let view = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                let point = CGPoint(x:0, y:50)
                let coords = view.coords(from:point)
                it("should convert point to CircularCoords") {
                    expect([Double(coords.angle).fromRadians,Double(coords.radius)]).to(beCloseTo([90, 50.0], within: 1.0))
                }
            }
            context("to coords 3") {
                let view = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                let point = CGPoint(x:50, y:0)
                let coords = view.coords(from:point)
                it("should convert point to CircularCoords") {
                    expect([Double(coords.angle).fromRadians,Double(coords.radius)]).to(beCloseTo([180, 50.0], within: 1.0))
                }
            }
            context("to coords 4") {
                let view = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                let point = CGPoint(x:50, y:100)
                let coords = view.coords(from:point)
                it("should convert point to CircularCoords") {
                    expect([Double(coords.angle).fromRadians,Double(coords.radius)]).to(beCloseTo([0, 50.0], within: 1.0))
                }
            }
            context("to point") {
                let view = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                let coords = CircularCoords(angle:CGFloat(90.0.toRadians), radius:50)
                let point = view.location(from:coords)
                
                it("should convert CircularCoords coordinates to CGPoint") {
                    expect([Double(point.x), Double(point.y)]).to(beCloseTo([0.0, 50.0], within:0.1))
                }
            }
            context("to point 1") {
                let view = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                let coords = CircularCoords(angle:CGFloat(270.0.toRadians), radius:50)
                let point = view.location(from:coords)
                
                it("should convert CircularCoords coordinates to CGPoint") {
                    expect([Double(point.x), Double(point.y)]).to(beCloseTo([100.0, 50.0], within:0.1))
                }
            }
        }
    }
}
