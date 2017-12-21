//
//  SingleCell.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/8.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

class SingleCell: UICollectionViewCell {

    @IBOutlet weak var picImageV: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var number: UILabel!
    
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 3.0
        self.layer.masksToBounds = true
                
        super.awakeFromNib()
        // Initialization code
    }
    
    func initWithData(_ model: SimpleModel){
    
        self.picImageV.sd_setImage(with: URL(string: model.cover_image_url), placeholderImage: UIImage(named: "nopic.jpg"))
        self.nameLabel.text = model.name
        self.price.text = "￥" + model.price
        self.number.text =  String(model.favorites_count)
        
    }
    
}
