//
//  HomeChildCell.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/25.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

class HomeChildCell: UITableViewCell {

    @IBOutlet weak var picImageV: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.picImageV.layer.cornerRadius = 3
        self.picImageV.layer.masksToBounds = true
        // Initialization code
        
        self.selectionStyle = .none

    }
    
    func initWithData(_ homeModel:HomeModel){
        
        self.picImageV.sd_setImage(with: URL(string: homeModel.cover_image_url as String), placeholderImage: UIImage(named: "nopic.jpg"))
        self.titleLabel.text = homeModel.title
        
    }
    
    func initWithModel(_ homeModel:PostsModel){
        
        self.picImageV.sd_setImage(with: URL(string: homeModel.cover_image_url as String), placeholderImage: UIImage(named: "nopic.jpg"))
        self.titleLabel.text = homeModel.short_title
        
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
