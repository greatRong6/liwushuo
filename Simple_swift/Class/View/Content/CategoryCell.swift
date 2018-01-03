//
//  CategoryCell.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/29.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    var titleLabel = UILabel()
    var backView = UIView()
    var picImageV = UIImageView()
    var shopBtn = UIButton()
    var nameLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.creatUI()
    }
    
    func creatUI(){
        
        self.titleLabel = UILabel.init(frame: CGRect(x: 10,y: 10,width: DEF_SCREEN_WIDTH - 20,height: 20))
        self.titleLabel.font = UIFont.systemFont(ofSize: 14)
        self.titleLabel.textColor = RGB(r: 180, g: 180, b: 180)
        self.contentView.addSubview(self.titleLabel)
        
        self.backView = UIView.init()
        self.contentView.addSubview(self.backView)
        
    }
    
    func initWithData(_ model:CategoryModel){
        
        self.titleLabel.text = model.name
        
        for view:UIView in self.backView.subviews{
            view.removeFromSuperview()
        }
        
        if model.channels.count != 0{
            
            for index in 0..<model.channels.count {
                
                let channelModel:ChannelsModel = model.channels[index]
                
                let row:CGFloat = CGFloat(index/4)
                let col:CGFloat = CGFloat(index%4)
                
                self.shopBtn = UIButton.init(type: .custom)
                self.shopBtn.frame = CGRect(x: DEF_SCREEN_WIDTH/4 * col,y: 90*row + 40,width: DEF_SCREEN_WIDTH/4,height: 80)
                self.shopBtn.addTarget(self, action: #selector(shopDetailClick), for: .touchUpInside)
                self.backView.addSubview(self.shopBtn)
                
                self.picImageV = UIImageView.init(frame: CGRect(x: self.shopBtn.frame.size.width/2 - 25,y: 0,width: 50,height: 50))
                self.picImageV.sd_setImage(with: URL(string: channelModel.icon_url as String), placeholderImage: UIImage(named: "nopic.jpg"))
                self.shopBtn.addSubview(self.picImageV)
                
                self.nameLabel = UILabel.init(frame: CGRect(x: 0,y: 55,width: self.shopBtn.frame.size.width,height: 20))
                self.nameLabel.text = channelModel.name
                self.nameLabel.textAlignment = .center
                self.shopBtn.addSubview(self.nameLabel)
                
            }
        }
    }
    
    @objc func shopDetailClick(){
        
    }
    
   func heightRowItem(model:CategoryModel) -> CGFloat{
        
        let row = model.channels.count
        let height:CGFloat = CGFloat(row/4) * 90
        
        return height
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
