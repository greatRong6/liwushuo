//
//  MorePostsCell.swift
//  Simple_swift
//
//  Created by iosdev on 2018/1/4.
//  Copyright © 2018年 gezhenrong. All rights reserved.
//

import UIKit

class MorePostsCell: UITableViewCell {

    var imageV:UIImageView = UIImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        imageV = UIImageView.init(frame: CGRect(x: 10,y: 5,width: DEF_SCREEN_WIDTH - 20,height: 100))
        imageV.backgroundColor = UIColor.red
        self.contentView.addSubview(imageV)
        
    }
    
    func initWithModel(_ model: PostsModel){
        self.imageV.sd_setImage(with: URL(string: model.cover_image_url as String), placeholderImage: UIImage(named: "nopic.jpg"))

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
