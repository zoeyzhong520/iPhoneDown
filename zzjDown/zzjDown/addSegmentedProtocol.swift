//
//  addSegmentedProtocol.swift
//  zzjDown
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 zzj. All rights reserved.
//

import Foundation
import UIKit

protocol AddSegmentedProtocol:NSObjectProtocol {
    func addSegmented(select:Selector)
}

extension AddSegmentedProtocol where Self:UIViewController {
    func addSegmented(select:Selector) {
        let segmentedControl = UISegmentedControl(frame: CGRect(x: 0, y: 0, width: screenWidth-100, height: 30))
        segmentedControl.insertSegmentWithTitle("今日限免", atIndex: 0, animated: true)
        segmentedControl.insertSegmentWithTitle("本周热门限免",
                                                atIndex: 1, animated: true)
        segmentedControl.insertSegmentWithTitle("热门限免总榜", atIndex: 2, animated: true)
        segmentedControl.addTarget(self, action: select, forControlEvents: .ValueChanged)
        
        navigationItem.titleView = segmentedControl
    }
    
}








