//
//  SimpleData.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/15.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit
import MJExtension

class SimpleData: NSObject {
    
    static let shareNetwork = SimpleData()
    var dataArray: [SimpleModel] = []
    var pageNum:Int = 0
    var pageSize:Int = 10
    
//    http://api.liwushuo.com/v2/items?gender=1&generation=1&limit=10&offset=0
    
    func loadProductData(callBlock: @escaping (Bool) -> Void){
        let params = [
            "gender": 1,
            "generation": 1,
            "limit": String(self.pageSize),
            "offset": String(self.pageNum)
            ] as [String : Any]
        BQHttpTool.request(method: .get, url: Simple_Url, parameters: params as NSDictionary) { ( result : AnyObject, error: Error?) in
            if error == nil{

                if result["code"] as! Int == 200{
                    
                    self.dataArray.removeAll()
                    
                    let array = (result["data"] as! [String: Any])["items"] as! [AnyObject]
                    
//                    self.dataSource = SimpleModel.mj_objectArray(withKeyValuesArray: dataArray) as! [SimpleModel]
                    
                    self.dataArray = array.map({ (item) -> SimpleModel in
                        
                        let model: SimpleModel = SimpleModel()
                        model.name = (item["data"] as! [String: Any])["name"] as! String
                        model.cover_image_url = (item["data"] as! [String: Any])["cover_image_url"] as! String
                        model.price = (item["data"] as! [String: Any])["price"] as! String
                        model.favorites_count = (item["data"] as! [String: Any])["favorites_count"] as! Int

                        return model
                    })
                    callBlock(true)
                }
            }else{
                callBlock(false)
            }
        }
    }
}
