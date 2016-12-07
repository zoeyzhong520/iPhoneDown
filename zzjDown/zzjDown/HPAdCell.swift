//
//  HPAdCell.swift
//  zzjDown
//
//  Created by zzj on 16/12/7.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class HPAdCell: UITableViewCell {

    @IBOutlet weak var pageCtrl: UIPageControl!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var adArray:Array<adModel>? {
        didSet {
            showData()
        }
    }
    
    func showData() {
        let cnt = adArray?.count
        if adArray?.count > 0 {
            
            //1.创建一个容器视图，作为滚动视图的子视图
            let containerView = UIView()
            scrollView.addSubview(containerView)
            containerView.snp_makeConstraints(closure: { (make) in
                make.edges.equalTo(scrollView)
                //一定要设置高度
                make.height.equalTo(scrollView)
            })
            
            //2.循环设置子视图的约束,子视图是添加到容器视图里面
            var lastView:UIView? = nil
            for i in 0..<cnt! {
                let model = adArray![i]
                let tmpImageView = UIImageView()
                if model.pic != nil {
                    tmpImageView.kf_setImageWithURL(NSURL(string: model.pic), placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                }
                
                containerView.addSubview(tmpImageView)
                
                //图片的约束
                tmpImageView.snp_makeConstraints(closure: { (make) in
                    make.top.bottom.equalTo(containerView)
                    make.width.equalTo(scrollView)
                    if lastView == nil {
                        make.left.equalTo(containerView)
                    }else{
                        make.left.equalTo(lastView!.snp_right)
                    }
                })
                
                lastView = tmpImageView
                
                //显示标题
                if model.title != nil {
                    titleLabel.text = adArray![pageCtrl.currentPage].title
                }
                
            }
            
            //3.修改container的宽度
            containerView.snp_makeConstraints(closure: { (make) in
                make.right.equalTo(lastView!)
            })
            
            pageCtrl.numberOfPages = cnt!
        }
        
    }
    
    //创建cell的方法
    class func createADCellFor(tableView:UITableView, atIndexPath indexPath:NSIndexPath, adArray:Array<adModel>?) -> HPAdCell {
        
        let cellId = "hPAdCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? HPAdCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("HPAdCell", owner: nil, options: nil).last as? HPAdCell
        }
        cell?.adArray = adArray
        return cell!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}

//MARK -- UIScrollView代理
extension HPAdCell:UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
         let index = scrollView.contentOffset.x/scrollView.bounds.size.width
        pageCtrl.currentPage = Int(index)
        
        //显示标题
        titleLabel.text = adArray![pageCtrl.currentPage].title
    }
}











