//
//  StrategyCollecCell.swift
//  Simple_swift
//
//  Created by iosdev on 2019/4/29.
//  Copyright © 2019 gezhenrong. All rights reserved.
//

import UIKit

class StrategyCollecCell: UICollectionViewCell {
    
    var picImageV:UIImageView?
    var name:UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        picImageV = UIImageView.init(frame: CGRect(x: 5,y: 5,width: 70,height: 70))
        self.contentView.addSubview(picImageV!)
        
        name = UILabel.init(frame: CGRect(x: 0,y: 75,width: 80,height: 30))
        name?.font = UIFont.systemFont(ofSize: 14)
        name?.numberOfLines = 0
        name?.textAlignment = .center
        self.contentView.addSubview(name!)
        
    }
    
    func initWithData(_ subModel:SubCateModel){
        picImageV!.sd_setImage(with: URL(string: subModel.icon_url as String), placeholderImage: UIImage(named: "box_01"))
        name?.text = subModel.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
