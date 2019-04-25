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
        
        self.backgroundColor = RGB(r: 230, g: 230, b: 230)
        
        self.titleLabel = UILabel(frame: CGRect(x: 0,y: 10, width:frame.size.width,height: 40))
        self.titleLabel.backgroundColor = UIColor.white
        self.titleLabel.font = UIFont.systemFont(ofSize: 15.0)
        self.addSubview(self.titleLabel)
        
        let line = UIView.init(frame: CGRect(x: 0,y: 50,width: frame.size.width,height: 1))
        line.backgroundColor = RGB(r: 230, g: 230, b: 230)
        self.addSubview(line)
        
    }
    
    func initWithData(_ title: String){
        
        self.titleLabel.text = "   \(title)";
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
