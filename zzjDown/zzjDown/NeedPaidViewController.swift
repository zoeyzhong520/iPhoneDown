//
//  NeedPaidViewController.swift
//  zzjDown
//
//  Created by qianfeng on 16/10/14.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class NeedPaidViewController: UITableViewController,navigationBarProtocol,AddReFreshProtocol {
    var dataArray:[HomePageModel] = []
    var currentPage = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        congfigUI()
        loadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    func loadData() {
        let ahomepageUrlString = String(format: paidspecificUrlString, currentPage)
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
        // #warning Incomplete implementation, return the number of rows
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
