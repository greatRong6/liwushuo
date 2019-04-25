//
//  StrategyCell.swift
//  Simple_swift
//
//  Created by iosdev on 2019/4/25.
//  Copyright © 2019 gezhenrong. All rights reserved.
//

import UIKit

class StrategyCell: UITableViewCell {
    
    var name:UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        name = UILabel.init(frame: CGRect(x: 10,y: 10,width: DEF_SCREEN_WIDTH/4,height: 20))
        name?.font = UIFont.systemFont(ofSize: 15)
        name?.backgroundColor = UIColor.red
        self.contentView.addSubview(name!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
