//
//  ChooseModel.swift
//  Simple_swift
//
//  Created by iosdev on 2019/5/7.
//  Copyright © 2019 gezhenrong. All rights reserved.
//

import UIKit

class ChooseModel: NSObject {

    @objc var content:String = ""
    @objc var name:String = ""
    @objc var cover_image_url:String = ""
    @objc var price:String = ""
    @objc var favorites_count:String = ""
    @objc var likes_count:String = ""
    @objc var contentHeight:CGFloat = 0
    //修改关键字
    override static func mj_replacedKeyFromPropertyName() -> [AnyHashable : Any]{
        return [
            "content": "description",
        ]
    }
    
}


class ChooseTitleModel: NSObject {
    
    @objc var key:String = ""
    @objc var name:String = ""
    @objc var order:String = ""
    @objc var channels:[ChannelsData] = []

}

class ChannelsData: NSObject {
    
    @objc var key:String = ""
    @objc var name:String = ""
    @objc var order:String = ""
    
}
