//
//  CategoryCell.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/29.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    var titleLabel = UILabel()
    var backView = UIView()
    var picImageV = UIImageView()
    var nameLabel = UILabel()
    
    typealias styleBlock = (_ index:Int) ->Void
    var moreButtonBlock:styleBlock?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.creatUI()
    }
        
    func creatUI(){
        
        self.picImageV = UIImageView.init(frame: CGRect(x: DEF_SCREEN_WIDTH/8 - 30,y: 10,width: 60,height: 60))
        self.contentView.addSubview(self.picImageV)
        
        self.nameLabel = UILabel.init(frame: CGRect(x: 0,y: 75,width: DEF_SCREEN_WIDTH/4,height: 20))
        self.nameLabel.textAlignment = .center
        self.nameLabel.text = " "
        self.contentView.addSubview(self.nameLabel)

    }
    
    func initWithData(_ channelModel:ChannelsModel){
        
        self.picImageV.sd_setImage(with: URL(string: channelModel.icon_url as String), placeholderImage: UIImage(named: "nopic.jpg"))
        self.nameLabel.text = channelModel.name
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
