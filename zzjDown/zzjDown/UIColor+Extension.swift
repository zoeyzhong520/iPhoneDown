//
//  UIColor+Extension.swift
//  zzjDown
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 zzj. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class func colorWith(R r:CGFloat,G g:CGFloat,B b:CGFloat,A a:CGFloat=1.0) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
}