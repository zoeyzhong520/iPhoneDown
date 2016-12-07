//
//  HomePageViewController.swift
//  zzjDown
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class HomePageViewController: UITableViewController,navigationBarProtocol,AddReFreshProtocol {
    var dataArray:[HomePageModel] = []
    var adDataArray:[adModel] = []
    var currentPage = 1
    var scrollView:UIScrollView!
    var pageControl:UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        congfigUI()
        
        loadData()
        
        ADloadData()
    }
    
    func loadData() {
        let ahomepageUrlString = String(format: homepageUrlString, currentPage)
        Alamofire.request(.GET, ahomepageUrlString).responseJSON { [unowned self](response) in
            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.endRefreshing()
            if self.currentPage == 1 {
                self.dataArray.removeAll()
            }
            if response.result.error == nil {
                let dic = response.result.value
                let appArray = dic as! [[String:AnyObject]]
                for app in appArray {
                    let model = HomePageModel()
                    model.setValuesForKeysWithDictionary(app)
                    self.dataArray.append(model)
                }
                self.tableView.reloadData()
            }
        }
    }
    
    func ADloadData() {
        Alamofire.request(.GET, adUrlString).responseJSON { [unowned self](response) in
            if response.result.error == nil {
                let adArray = response.result.value as! [[String:AnyObject]]
                for value in adArray {
                    let model = adModel()
                    model.setValuesForKeysWithDictionary(value)
                    self.adDataArray.append(model)
                }
                self.tableView.reloadData()
            }
        }
    }
    
    func congfigUI() {
        addTitle("精品限时免费")
        tableView.registerClass(HPViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        addRefresh({ [unowned self] in
            self.currentPage = 1
            self.loadData()
        }) { [unowned self] in
            self.currentPage += 1
            self.loadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count+1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var height:CGFloat = 0
        if indexPath.row == 0 {
            height = 180
        }else{
            height = 100
        }
        return height
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = HPAdCell.createADCellFor(tableView, atIndexPath: indexPath, adArray: adDataArray)
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! HPViewCell
            let model = dataArray[indexPath.row-1]
            cell.appName.text = model.app_name
            cell.appSome.text = "评分:\(model.app_apple_rated)星  类别:\(model.app_category)  \(model.app_size)"
            if Int(model.app_price) != 0 {
                cell.priceBGImageView.image = UIImage(named: "price-bg-lan.png")
                cell.appPrice.text = "\(model.app_price)元"
            }else{
                cell.priceBGImageView.image = UIImage(named: "price-bg.png")
                cell.appPrice.text = "免费中"
            }
            cell.appDetail.text = model.app_desc
            if model.app_icon != nil {
                cell.appIconImage.kf_setImageWithURL(NSURL(string: model.app_icon))
            }
            return cell
        }
        
    }
    
    
}


















