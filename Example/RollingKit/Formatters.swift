//
//  Formatters.swift
//  RollingKit_Example
//
//  Created by Max Deygin on 3/13/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

var roundedFloatFormatter : NumberFormatter{
    get{
        let frm = NumberFormatter()
        frm.minimumFractionDigits = 0
        frm.maximumFractionDigits = 0
        return frm
    }
}
