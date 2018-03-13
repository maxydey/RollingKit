//
//  ValueTransformations.swift
//  RollingKit
//
//  Created by Max Deygin on 3/4/18.
//

import Foundation

extension FloatingPoint {
    public var toRadians: Self { return self * .pi / 180 }
    public var fromRadians: Self { return self * 180 / .pi }
}

extension SignedInteger {
    public var toRadians: Double { return Double(Int(self)) * Double.pi / 180 }
}

