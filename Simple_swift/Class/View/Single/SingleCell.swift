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
        
        super.awakeFromNib()
        // Initialization code
    }
    
    func initWithData(_ model: SimpleModel){
    
        self.picImageV.sd_setImage(with: NSURL(string: "http://www.szplanner.com/images/inside/product_activity_thumb.jpg")! as URL, placeholderImage: UIImage(named: "nopic.jpg")) { (image, error, cacheType, url) -> Void in
//            println("成功")
        }
        self.nameLabel.text = model.name
//        self.picImageV.sd_setImage(with: NSURL(string: model.cover_image_url!)! as URL, placeholderImage: nil, options: nil) { (image, error, chcheType, imageUrl) in
        
        }
    
}
