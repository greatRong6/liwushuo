//
//  CategoryHeadView.swift
//  Simple_swift
//
//  Created by iosdev on 2018/1/8.
//  Copyright © 2018年 gezhenrong. All rights reserved.
//

import UIKit

class CategoryHeadView: UICollectionReusableView {
    
    var titleLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.titleLabel = UILabel(frame: CGRect(x: 0,y: 0, width:frame.size.width,height: frame.size.height))
        self.titleLabel.font = UIFont.systemFont(ofSize: 15.0)
        self.addSubview(self.titleLabel)
        
    }
    
    func initWithData(_ title: String){
        
        self.titleLabel.text = "   \(title)";
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
