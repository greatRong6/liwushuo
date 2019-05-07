//
//  ChooseViewCell.swift
//  Simple_swift
//
//  Created by iosdev on 2019/5/7.
//  Copyright © 2019 gezhenrong. All rights reserved.
//

import UIKit

class ChooseViewCell: UICollectionViewCell {
    
    var picImageV:UIImageView?
    var contentL:UILabel?
    var priceL:UILabel?
    var backView:UIView?
    var number:UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backView = UIView.init(frame: CGRect(x: 0,y: 0,width: (DEF_SCREEN_WIDTH - 30)/2,height: 0))
        backView?.backgroundColor = UIColor.white
        self.contentView.addSubview(backView!)
        
        self.picImageV = UIImageView.init(frame: CGRect(x: 0,y: 0,width: (DEF_SCREEN_WIDTH - 30)/2,height: 145))
        backView!.addSubview(picImageV!)
        
        contentL = UILabel.init(frame: CGRect(x: 8,y: 150,width: (picImageV?.frame.size.width)! - 16,height: 0))
        contentL?.numberOfLines = 0
        contentL?.font = UIFont.systemFont(ofSize: 14)
        backView!.addSubview(contentL!)
        
        priceL = UILabel.init(frame: CGRect(x: 8,y: 0,width: backView!.width/2-8,height: 30))
        priceL?.numberOfLines = 0
        priceL?.font = UIFont.systemFont(ofSize: 14)
        priceL?.textColor = DefauleColor()
        backView!.addSubview(priceL!)
        
        number = UILabel.init(frame: CGRect(x: backView!.width/2,y: 0,width: backView!.width/2-8,height: 30))
        number?.font = UIFont.systemFont(ofSize: 14)
        number?.textColor = RGB(r: 200, g: 200, b: 200)
        number?.textAlignment = .right
        backView!.addSubview(number!)

        
    }
    
    func initWithData(_ chooseModel:ChooseModel){
        
        self.picImageV!.sd_setImage(with: URL(string: chooseModel.cover_image_url as String), placeholderImage: UIImage(named: "nopic.jpg"))
        self.contentL!.text = chooseModel.content
        priceL?.text = "￥" + chooseModel.price
        number?.text = chooseModel.favorites_count

        contentL?.height = chooseModel.contentHeight
        priceL?.y = contentL!.maxY
        number?.y = priceL!.y
        backView?.height = chooseModel.contentHeight + 185

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
