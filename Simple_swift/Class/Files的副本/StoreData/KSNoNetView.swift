//
//  KSNoNetView.swift
//  Simple_swift
//
//  Created by iosdev on 2018/1/24.
//  Copyright © 2018年 gezhenrong. All rights reserved.
//

import UIKit

class KSNoNetView: UIView {
    
    typealias styleBlock = (UIButton) ->Void
    var moreButtonBlock:styleBlock?
    
    @IBAction func reloadNetworkDataSource(_ sender: UIButton) {
        
        if moreButtonBlock != nil{
            moreButtonBlock!(sender)
        }

    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
