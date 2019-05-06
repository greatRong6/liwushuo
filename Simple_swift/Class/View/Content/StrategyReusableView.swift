//
//  StrategyReusableView.swift
//  Simple_swift
//
//  Created by iosdev on 2019/4/29.
//  Copyright © 2019 gezhenrong. All rights reserved.
//

import UIKit

class StrategyReusableView: UICollectionReusableView {
    
    var titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        self.titleLabel = UILabel(frame: CGRect(x: frame.size.width/2 - 50,y: 5, width:100,height: 40))
        self.titleLabel.backgroundColor = UIColor.white
        self.titleLabel.font = UIFont.systemFont(ofSize: 15.0)
        self.titleLabel.textAlignment = .center
        self.titleLabel.text = "2323"
        self.addSubview(self.titleLabel)
        
        let line = UIView.init(frame: CGRect(x: 10,y: 25,width: frame.size.width/2 - 65,height: 1))
        line.backgroundColor = RGB(r: 230, g: 230, b: 230)
        self.addSubview(line)
        
        let line1 = UIView.init(frame: CGRect(x: frame.size.width/2 + 55,y: 25,width: frame.size.width/2 - 65,height: 1))
        line1.backgroundColor = RGB(r: 230, g: 230, b: 230)
        self.addSubview(line1)

        
    }
    
    func initWithData(_ title: String){
        
        self.titleLabel.text = "   \(title)";
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
