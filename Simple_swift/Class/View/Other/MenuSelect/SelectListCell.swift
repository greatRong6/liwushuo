//
//  SelectListCell.swift
//  Simple_swift
//
//  Created by iosdev on 2019/5/8.
//  Copyright © 2019 gezhenrong. All rights reserved.
//

import UIKit

class SelectListCell: UITableViewCell {
    
    var nameL:UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameL = UILabel.init(frame: CGRect(x: 15,y: 15,width: DEF_SCREEN_WIDTH-30,height: 20))
        nameL?.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(nameL!)
        
    }
    
    func initWithData(titleModel:ChannelsData){
        
        nameL?.text = titleModel.name
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
