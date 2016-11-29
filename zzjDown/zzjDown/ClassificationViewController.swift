//
//  ClassificationViewController.swift
//  zzjDown
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class ClassificationViewController: UITableViewController,navigationBarProtocol,AddReFreshProtocol {
    var dataArray:[classifyModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        loadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func configUI() {
        addTitle("按分类筛选")
        tableView.registerClass(classifyViewCell.classForCoder(), forCellReuseIdentifier: "cell")
    }
    
    func loadData() {
        Alamofire.request(.GET, classifyUrlString).responseJSON { [unowned self](response) in
            if response.result.error == nil {
                let array = response.result.value as! [AnyObject]
                for array1 in array {
                    let array2 = array1["list"] as! [AnyObject]
                    for dic in array2 {
                        let model = classifyModel()
                        model.setValuesForKeysWithDictionary(dic as! [String : AnyObject])
                        self.dataArray.append(model)
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "推荐栏目"
        }else{
            return "官方分类"
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! classifyViewCell
        let model = dataArray[indexPath.row]
        cell.appName.text = model.title
        cell.appDetail.text = model.desc
        cell.appIconImage.kf_setImageWithURL(NSURL(string: model.icon))
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = OrderViewController2()
        let model = dataArray[indexPath.row]
        vc.title = model.title
        navigationController?.pushViewController(vc, animated: true)
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}











