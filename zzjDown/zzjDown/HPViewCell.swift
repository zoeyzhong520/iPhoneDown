//
//  HPViewCell.swift
//  zzjDown
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import SnapKit

class HPViewCell: UITableViewCell {
    var appIconImage:UIImageView!
    var appName:UILabel!
    var appSome:UILabel!
    var appPrice:UILabel!
    var appDetail:UILabel!
    var priceBGImageView:UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell() {
        appIconImage = UIImageView()
        contentView.addSubview(appIconImage)
        appIconImage.snp_makeConstraints { (make) in
            make.left.equalTo(contentView.snp_left).offset(15)
            make.top.equalTo(contentView.snp_top).offset(15)
            make.size.equalTo(CGSize(width: 100, height: 70))
        }
        
        appName = UILabel()
        appName.font = UIFont.systemFontOfSize(fontLevelTwo)
        contentView.addSubview(appName)
        appName.snp_makeConstraints { (make) in
            make.top.equalTo(contentView.snp_top).offset(8)
            make.left.equalTo(appIconImage.snp_right).offset(10)
            make.height.equalTo(20)
            make.trailingMargin.lessThanOrEqualTo(contentView).offset(10)
        }
        
        appSome = UILabel()
        appSome.font = UIFont.systemFontOfSize(fontLevelSeven)
        contentView.addSubview(appSome)
        appSome.snp_makeConstraints { (make) in
            make.height.equalTo(20)
            make.top.equalTo(appName.snp_bottom).offset(10)
            make.left.equalTo(appIconImage.snp_right).offset(10)
        }
        
        appDetail = UILabel()
        contentView.addSubview(appDetail)
        appDetail.snp_makeConstraints { (make) in
            make.left.equalTo(appIconImage.snp_right).offset(10)
            make.height.equalTo(20)
            make.bottom.equalTo(contentView.snp_bottom).offset(-10)
            make.trailingMargin.lessThanOrEqualTo(contentView).offset(10)
        }
        
        priceBGImageView = UIImageView()
        contentView.addSubview(priceBGImageView)
        priceBGImageView.snp_makeConstraints { (make) in
            make.centerY.equalTo(appSome.snp_centerY)
            make.height.equalTo(20)
            make.right.equalTo(contentView.snp_right).offset(-20)
        }
        
        appPrice = UILabel()
        appPrice.font = UIFont.systemFontOfSize(fontLevelSix)
        contentView.addSubview(appPrice)
        appPrice.snp_makeConstraints { (make) in
            make.right.equalTo(priceBGImageView.snp_right).offset(-5)
            make.centerY.equalTo(priceBGImageView.snp_centerY)
            make.left.equalTo(priceBGImageView.snp_left).offset(10)
            make.top.equalTo(priceBGImageView.snp_top).offset(5)
        }
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

