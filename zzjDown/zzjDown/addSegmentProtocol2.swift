//
//  addSegmentProtocol2.swift
//  zzjDown
//
//  Created by qianfeng on 16/10/14.
//  Copyright © 2016年 zzj. All rights reserved.
//

import Foundation
import UIKit

protocol AddSegmentProtocol2:NSObjectProtocol {
    func addSegmented2(select:Selector)
}

extension AddSegmentProtocol2 where Self:UIViewController {
    func addSegmented2(select:Selector) {
        let segmented=UISegmentedControl(items: ["全部","免费","限免","付费"])
        segmented.frame=CGRect(x: 40, y: 200, width: screenWidth-80, height: 40)
        segmented.addTarget(self, action: select, forControlEvents: .ValueChanged)
        view.addSubview(segmented)
    }
    
    
}
