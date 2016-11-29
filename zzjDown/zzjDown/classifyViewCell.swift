//
//  classifyViewCell.swift
//  zzjDown
//
//  Created by qianfeng on 16/10/14.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import SnapKit

class classifyViewCell: UITableViewCell {
    var appIconImage:UIImageView!
    var appName:UILabel!
    var appDetail:UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
        appName.font = UIFont.systemFontOfSize(fontLevelOne)
        contentView.addSubview(appName)
        appName.snp_makeConstraints { (make) in
            make.top.equalTo(contentView.snp_top).offset(20)
            make.left.equalTo(appIconImage.snp_right).offset(10)
            make.height.equalTo(20)
            make.trailingMargin.lessThanOrEqualTo(contentView).offset(10)
        }
        appDetail = UILabel()
        appDetail.font = UIFont.systemFontOfSize(fontLevelTwo)
        contentView.addSubview(appDetail)
        appDetail.snp_makeConstraints { (make) in
            make.left.equalTo(appIconImage.snp_right).offset(10)
            make.height.equalTo(20)
            make.bottom.equalTo(contentView.snp_bottom).offset(-20)
            make.trailingMargin.lessThanOrEqualTo(contentView).offset(10)
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
