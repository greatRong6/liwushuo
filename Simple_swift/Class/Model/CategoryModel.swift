//
//  CategoryModel.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/29.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit


//风格 品类
class CategoryModel: NSObject {
    
    var channels:[ChannelsModel] = []
    var name:String = ""
    var cataId:Int = 0
    var status:String = ""
    
}

class ChannelsModel: NSObject {
    
    var icon_url:String = ""
    var name:String = ""
    var group_id:Int = 0
    
    
}

//专题合集

class CollectionModel: NSObject {
    var banner_image_url:String = ""
    var cover_image_url:String = ""
    var created_at:String = ""
    var posts:[PostsModel] = []

}

class PostsModel: NSObject {
    
    var cover_image_url:String = ""
    var title:String = ""
    var updated_at:String = ""
    var content_url:String = ""
    var subtitle:String = ""
    var banner_image_url:String = ""
    var cover_webp_url:String = ""
    var short_title:String = ""
    var group_id:Int = 0
    
}
