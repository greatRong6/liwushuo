//
//  HomeModel.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/21.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

class HomeModel: NSObject {
    
    @objc var content_url: String = ""
    @objc var cover_image_url: String = ""
    @objc var short_title: String = ""
    @objc var title: String = ""

}

class HomePicModel: NSObject {
    
    @objc var image_url: String = ""

}

class HomeButtonModel: NSObject {
    
    @objc var icon_url: String = ""
    @objc var title: String = ""
    @objc var target_url: String = ""

}
