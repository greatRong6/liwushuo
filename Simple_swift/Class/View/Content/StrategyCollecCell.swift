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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.picImageV = UIImageView.init(frame: CGRect(x: 0,y: 0,width: frame.size.width,height: frame.size.height))
        self.picImageV?.backgroundColor = UIColor.red
        self.contentView.addSubview(self.picImageV!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
