//
//  MainTableDelegate.swift
//  RollingKit_Example
//
//  Created by Max Deygin on 3/13/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
class ScenesDataSource:NSObject, UITableViewDataSource  {
    
    let cellIdentifiers = ["BasicCircle","RollView"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellIdentifiers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: cellIdentifiers[indexPath.row])!
    }
}


