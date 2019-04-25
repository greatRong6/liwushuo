//
//  StrategyModel.swift
//  Simple_swift
//
//  Created by iosdev on 2019/4/25.
//  Copyright © 2019 gezhenrong. All rights reserved.
//

import UIKit

class StrategyModel: NSObject {
    
    @objc var code:String = ""
    @objc var data:[CategoModel] = []
    @objc var message:String = ""

}

class CategoModel: NSObject {
    
    @objc var icon_url:String = ""
    @objc var cateId:String = ""
    @objc var name:String = ""
    @objc var order:String = ""
    @objc var status:String = ""
    @objc var subcategories:[SubCateModel] = []
    //修改关键字
    override static func mj_replacedKeyFromPropertyName() -> [AnyHashable : Any]{
        return [
                "cateId": "id",
                ]
    }
}

class SubCateModel: NSObject {
    @objc var icon_url:String = ""
    @objc var subCateId:String = ""
    @objc var name:String = ""
    @objc var order:String = ""
    @objc var items_count:String = ""
    @objc var parent_id:String = ""
    @objc var status:String = ""
    //修改关键字
    override static func mj_replacedKeyFromPropertyName() -> [AnyHashable : Any]{
        return [
            "subCateId": "id",
        ]
    }

}
