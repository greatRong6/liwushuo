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
        
        self.picImageV = UIImageView.init(frame: CGRect(x: DEF_SCREEN_WIDTH/8 - 30,y: 0,width: 60,height: 60))
        self.contentView.addSubview(self.picImageV)
        
        self.nameLabel = UILabel.init(frame: CGRect(x: 0,y: 70,width: DEF_SCREEN_WIDTH/4,height: 20))
        self.nameLabel.textAlignment = .center
        self.nameLabel.text = "323232 "
        self.contentView.addSubview(self.nameLabel)

    }
    
    func initWithData(_ channelModel:ChannelsModel){
        
        self.picImageV.sd_setImage(with: URL(string: channelModel.icon_url as String), placeholderImage: UIImage(named: "nopic.jpg"))
        self.nameLabel.text = channelModel.name

//
//        for view:UIView in self.backView.subviews{
//            view.removeFromSuperview()
//        }
//
//        if model.channels.count != 0{
//
//            for index in 0..<model.channels.count {
//
//                let channelModel:ChannelsModel = model.channels[index]
//
//                let row:CGFloat = CGFloat(index/4)
//                let col:CGFloat = CGFloat(index%4)
//
//                self.shopBtn = UIButton.init(type: .system)
//                self.shopBtn.tag = 1000 + index
//                self.shopBtn.frame = CGRect(x: DEF_SCREEN_WIDTH/4 * col,y: 90*row + 40,width: DEF_SCREEN_WIDTH/4,height: 80)
//                self.shopBtn.addTarget(self, action: #selector(shopDetailClick(btn :)), for: .touchUpInside)
//                self.backView.addSubview(self.shopBtn)
//
//                self.picImageV = UIImageView.init(frame: CGRect(x: self.shopBtn.frame.size.width/2 - 25,y: 0,width: 50,height: 50))
//                self.picImageV.isUserInteractionEnabled = true
//                self.picImageV.sd_setImage(with: URL(string: channelModel.icon_url as String), placeholderImage: UIImage(named: "nopic.jpg"))
//                self.shopBtn.addSubview(self.picImageV)
//
//                self.nameLabel = UILabel.init(frame: CGRect(x: 0,y: 55,width: self.shopBtn.frame.size.width,height: 20))
//                self.nameLabel.text = channelModel.name
//                self.picImageV.isUserInteractionEnabled = false
//                self.nameLabel.textAlignment = .center
//                self.shopBtn.addSubview(self.nameLabel)
//            }
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
