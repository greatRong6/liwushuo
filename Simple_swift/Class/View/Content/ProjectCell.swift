//
//  ProjectCell.swift
//  Simple_swift
//
//  Created by iosdev on 2018/1/3.
//  Copyright © 2018年 gezhenrong. All rights reserved.
//

import UIKit

class ProjectCell: UICollectionViewCell {
    
    var imageV:UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.imageV =  UIImageView.init(frame: CGRect(x: 0,y: 0,width: 130,height: 80))
        imageV.layer.cornerRadius = 3
        imageV.layer.masksToBounds = true
        self.contentView.addSubview(self.imageV)
        
    }
    
    func initWithData(_ model: PostsModel){
        
        self.imageV.sd_setImage(with: URL(string: model.banner_image_url as String), placeholderImage: UIImage(named: "nopic.jpg"))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
