//
//  CreatTabBar.swift
//  zzjDown
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 zzj. All rights reserved.
//

import Foundation
import UIKit

extension AppDelegate {
    func creatRoot() {
       let tab = UITabBarController()
        var viewControllers:[UIViewController] = []
        let vcNames = ["zzjDown.HomePageViewController","zzjDown.OrderViewController","zzjDown.ClassificationViewController","zzjDown.RecommendViewController","zzjDown.MoreViewController"]
        let imageNames = ["item_app_home.png","item_app_pricedrop.png","item_app_category.png","item_app_hot.png","item_app_more.png"]
        let titles = ["首页","今日限免","分类","推荐","更多"]
        for i in 0..<vcNames.count {
            let vcClasss = NSClassFromString(vcNames[i]) as! UIViewController.Type
            let vc = vcClasss.init()
            let nav = UINavigationController(rootViewController: vc)
            nav.tabBarItem.image = UIImage(named: imageNames[i])
            nav.title = titles[i]
            viewControllers.append(nav)
        }
        tab.viewControllers = viewControllers
        window?.rootViewController = tab
    }
}
