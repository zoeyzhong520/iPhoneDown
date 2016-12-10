//
//  TotalGamesViewController.swift
//  zzjDown
//
//  Created by qianfeng on 16/10/14.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class TotalGamesViewController: UITableViewController,navigationBarProtocol,AddReFreshProtocol,UIGestureRecognizerDelegate {
    
    var dataArray:[HomePageModel] = []
    
    var currentPage = 1
    
    var urlString:String? = allspecificUrlString
    
    var bgView:UIView?
    
    var segmented:UISegmentedControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //恢复滑动返回手势
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        congfigUI()
        
        //下载数据
        loadData(urlString)
        loadData(freespecificUrlString)
        loadData(pricedropspecificUrlString)
        loadData(paidspecificUrlString)
        
    }
    
    //添加蒙层
    func addBgMaskView() {
        if bgView == nil {
            bgView = UIView(frame: CGRect(x: 0, y: 64, width: screenWidth, height: screenHeight-64))
            bgView!.backgroundColor = UIColor.blackColor()
            bgView!.alpha = 0.8
        }
        UIApplication.sharedApplication().keyWindow?.addSubview(bgView!)
        //view.addSubview(bgView!)
    }
    
    func addSegmented2(select:Selector) {
        
        if segmented == nil {
            segmented = UISegmentedControl(items: ["全部","免费","限免","付费"])
            segmented!.frame=CGRect(x: 40, y: 200, width: screenWidth-80, height: 40)
            segmented!.addTarget(self, action: select, forControlEvents: .ValueChanged)
            segmented!.momentary = false
        }
        bgView!.addSubview(segmented!)
        
    }
    
    func loadData(urlString:String?) {
        
        let ahomepageUrlString = String(format: urlString!, currentPage)
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
    
    func congfigUI() {
        
        addTitle(title!)
        
        addButton("返回", position: .left, selector: #selector(leftButtonClick(_:)))
        
        addButton("全部", position: .right, selector: #selector(rightButtonClick(_:)))
        
        tableView.registerClass(HPViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        addRefresh({ [unowned self] in
            self.currentPage = 1
            self.loadData(self.urlString)
        }) { [unowned self] in
            self.currentPage += 1
            self.loadData(self.urlString)
        }
    }
    
    func leftButtonClick(btn:UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func rightButtonClick(btn:UIButton) {
        addBgMaskView()
        addSegmented2(#selector(segmentClick(_:)))
        self.tableView.scrollEnabled = false
    }
    
    func segmentClick(segment:UISegmentedControl) {
        
        self.tableView.scrollEnabled = true
        
        switch segment.selectedSegmentIndex {
        case 0:
            loadData(urlString)
            break
        case 1:
            urlString = freespecificUrlString
            loadData(urlString)
            break
        case 2:
            urlString = pricedropspecificUrlString
            loadData(urlString)
            break
        case 3:
            urlString = paidspecificUrlString
            loadData(urlString)
            break
        default:
            break
        }
        self.bgView?.removeFromSuperview()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! HPViewCell
        let model = dataArray[indexPath.row]
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


















