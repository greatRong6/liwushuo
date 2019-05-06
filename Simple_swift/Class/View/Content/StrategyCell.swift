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
    var redView:UIView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        name = UILabel.init(frame: CGRect(x: 10,y: 20,width: DEF_SCREEN_WIDTH,height: 20))
        name?.font = UIFont.systemFont(ofSize: 14)
        self.contentView.addSubview(name!)
        
        self.redView = UIView.init(frame: CGRect(x: 0,y: 0,width: 5,height: 60))
        self.redView?.backgroundColor = DefauleColor()
        self.contentView.addSubview(self.redView!)
        
        self.selectionStyle = .none
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.contentView.backgroundColor = selected ? UIColor.white : RGB(r: 230, g: 230, b: 230)
        self.name?.textColor = selected ? DefauleColor() : UIColor.black
        self.isHighlighted = selected
        self.name?.isHighlighted = selected
        self.redView?.isHidden = !selected
        
        // Configure the view for the selected state
    }

}
