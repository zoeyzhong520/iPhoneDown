//
//  OrderViewController.swift
//  zzjDown
//
//  Created by qianfeng on 16/10/14.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController,AddSegmentedProtocol,navigationBarProtocol {
    
    var ChildVCS:[UIViewController] = []
    var currentVC:UIViewController?//记录当前视图控制器
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderViewControll()
        configUI()
        self.view.backgroundColor = UIColor.whiteColor()
        
    }
    
    func configUI() {
        addTitle("")
        addSegmented(#selector(segmentClick(_:)))
    }
    
    func segmentClick(segment:UISegmentedControl) {
        let new = ChildVCS[segment.selectedSegmentIndex%3]
        if currentVC != new {
            self.exchangeOld(currentVC!, new:new)
        }
    }
    
    func orderViewControll() {
        let sW = self.view.frame.size.width
        let sH = self.view.frame.size.height
        let VC1 = TodayLimitViewController()
        VC1.view.frame = CGRect(x: 0, y: 0, width: sW, height: sH)
        self.view.addSubview(VC1.view)
        self.addChildViewController(VC1)
        currentVC = VC1
        ChildVCS.append(VC1)
        let VC2 = ThisWeekHotLimitViewController()
        VC2.view.frame = CGRect(x: 0, y: 0, width: sW, height: sH)
        ChildVCS.append(VC2)
        let VC3 = TotalHotLimitViewController()
        VC3.view.frame = CGRect(x: 0, y: 0, width: sW, height: sH)
        ChildVCS.append(VC3)
    }
    
    func exchangeOld(old:UIViewController,new:UIViewController) {
        self.addChildViewController(new)
        self.transitionFromViewController(old, toViewController: new, duration: 0.5, options: .CurveEaseInOut, animations: nil) {[unowned self] (b) in
            if b {
                old.removeFromParentViewController()
                self.currentVC = new
            }else{
                new.removeFromParentViewController()
                self.currentVC = old
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

