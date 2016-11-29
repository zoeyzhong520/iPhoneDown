//
//  Theme.swift
//  zzjDown
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 zzj. All rights reserved.
//

import Foundation
import UIKit

let screenWidth = UIScreen.mainScreen().bounds.width
let screenHeight = UIScreen.mainScreen().bounds.height

//字体
let fontLevelOne:CGFloat = 24
let fontLevelTwo:CGFloat = 20
let fontLevelThree:CGFloat = 18
let fontLevelFour:CGFloat = 16
let fontLevelFive:CGFloat = 14
let fontLevelSix:CGFloat = 12
let fontLevelSeven:CGFloat = 10
//定义颜色
let colorTitle = UIColor.colorWith(R: 255, G: 255, B: 255)
let colorAdvertisement = UIColor.colorWith(R: 56, G: 165, B: 198)

//url
let homepageUrlString = "http://api.ipadown.com/iphone-client/apps.list.php?t=index&count=10&page=%ld&device=iPhone&price=all"
let adUrlString = "http://api.ipadown.com/iphone-client/ad.flash.php?count=5&device=iphone"
let todaylimitUrlString = "http://api.ipadown.com/iphone-client/apps.list.php?device=iPhone&price=pricedrop&count=10&page=%ld"
let thisweekhotlimitUrlString = "http://api.ipadown.com/iphone-client/apps.list.php?device=iPhone&price=pricedrop&subday=7&orderby=views&count=10&page=%ld"
let totalhotlimitUrlString = "http://api.ipadown.com/iphone-client/apps.list.php?device=iPhone&price=pricedrop&orderby=views&count=10&page=%ld"
let classifyUrlString = "http://api.ipadown.com/iphone-client/category.list.php"
let allspecificUrlString = "http://api.ipadown.com/iphone-client/apps.list.php?cateid=6002&count=10&page=%ld&device=iPhone&price=all"
let freespecificUrlString = "http://api.ipadown.com/iphone-client/apps.list.php?cateid=6002&count=10&page=%ld&device=iPhone&price=free"
let pricedropspecificUrlString = "http://api.ipadown.com/iphone-client/apps.list.php?cateid=6002&count=10&page=%ld&device=iPhone&price=pricedrop"
let paidspecificUrlString = "http://api.ipadown.com/iphone-client/apps.list.php?cateid=6002&count=10&page=%ld&device=iPhone&price=paid"







