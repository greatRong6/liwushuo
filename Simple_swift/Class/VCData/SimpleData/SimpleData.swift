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
    var dataSource: [SimpleModel] = []
    var pageNum:Int = 1
    var pageSize:Int = 10

    func loadProductData(callBlock: @escaping (Bool) -> Void){
        let params = [
            "gender": 1,
            "generation": String(self.pageNum),
            "limit": String(self.pageSize),
            "offset": 0
            ] as [String : Any]
        BQHttpTool.request(method: .get, url: Simple_Url, parameters: params as NSDictionary) { ( result : AnyObject, error: Error?) in
            if error == nil{
                print(result)
                if result["code"] as! Int == 200{
                    
                    let dataArray = (result["data"] as! [String: Any])["items"] as! [AnyObject]
                    
                    if self.pageNum == 1{
                        self.dataSource.removeAll()
                    }
//                    self.dataSource = SimpleModel.mj_objectArray(withKeyValuesArray: dataArray) as! [SimpleModel]
                    
                    self.dataSource = dataArray.map({ (item) -> SimpleModel in
                        
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
