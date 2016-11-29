//
//  OrderViewController2.swift
//  zzjDown
//
//  Created by qianfeng on 16/10/14.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class OrderViewController2: UIViewController,AddSegmentProtocol2,navigationBarProtocol {
    
    var ChildVCS:[UIViewController] = []
    var currentVC:UIViewController?
    var bgView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderViewControll()
        configUI()
        self.view.backgroundColor = UIColor.whiteColor()
        
    }
    
    func configUI() {
        automaticallyAdjustsScrollViewInsets = false
        addTitle(title!)
        addButton("返回", imageName: "backButton.png", position: .left, selector: #selector(leftButtonClick(_:)))
        addButton("全部", imageName: "navButton.png", position: .right, selector: #selector(rightButtonClick(_:)))
    }
    
    func leftButtonClick(btn:UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func rightButtonClick(btn:UIButton) {
        addSegmented2(#selector(segmentClick(_:)))
    }
    
    func segmentClick(segment:UISegmentedControl) {
        let new = ChildVCS[segment.selectedSegmentIndex%4]
        if currentVC != new {
            self.exchangeOld(currentVC!, new:new)
        }
    }
    
    func orderViewControll() {
        let sW = self.view.frame.size.width
        let sH = self.view.frame.size.height
        let VC1 = TotalGamesViewController()
        VC1.view.frame = CGRect(x: 0, y: 0, width: sW, height: sH)
        self.view.addSubview(VC1.view)
        self.addChildViewController(VC1)
        currentVC = VC1
        ChildVCS.append(VC1)
        let VC2 = FreeViewController()
        VC2.view.frame = CGRect(x: 0, y: 0, width: sW, height: sH)
        ChildVCS.append(VC2)
        let VC3 = LimitFreeViewController()
        VC3.view.frame = CGRect(x: 0, y: 0, width: sW, height: sH)
        ChildVCS.append(VC3)
        let VC4 = NeedPaidViewController()
        VC4.view.frame = CGRect(x: 0, y: 0, width: sW, height: sH)
        ChildVCS.append(VC4)
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

