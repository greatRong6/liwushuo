//
//  HomeCell.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/21.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var picImageV: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
