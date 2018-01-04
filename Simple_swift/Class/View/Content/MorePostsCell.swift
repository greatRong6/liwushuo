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
    var titleLabel:UILabel = UILabel()
    var shortLabel:UILabel = UILabel()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        imageV = UIImageView.init(frame: CGRect(x: 10,y: 5,width: DEF_SCREEN_WIDTH - 20,height: 150))
        imageV.backgroundColor = UIColor.red
        self.contentView.addSubview(imageV)
        
        titleLabel = UILabel.init(frame: CGRect(x: 10,y: 60, width: DEF_SCREEN_WIDTH - 20,height: 20))
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        self.contentView.addSubview(titleLabel)
        
        titleLabel = UILabel.init(frame: CGRect(x: 10,y: 50, width: DEF_SCREEN_WIDTH - 20,height: 20))
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(titleLabel)

        shortLabel = UILabel.init(frame: CGRect(x: 10,y: 100, width: DEF_SCREEN_WIDTH - 20,height: 20))
        shortLabel.textColor = UIColor.white
        shortLabel.textAlignment = .center
        shortLabel.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(shortLabel)

    }
    
    func initWithModel(_ model: PostsModel){
        
        self.imageV.sd_setImage(with: URL(string: model.cover_image_url as String), placeholderImage: UIImage(named: "nopic.jpg"))
        titleLabel.text = model.title
        shortLabel.text = model.subtitle
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
