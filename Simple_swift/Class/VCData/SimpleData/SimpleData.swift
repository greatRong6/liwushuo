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

    func loadProductData(callBlock: @escaping (Bool) -> Void){
        let params = [
            "gender": 1,
            "generation": 1,
            "limit": 20,
            "offset": 0
        ]
        BQHttpTool.request(method: .get, url: Simple_Url, parameters: params as NSDictionary) { ( result : AnyObject, error: Error?) in
            if error == nil{
                print(result)
                if result["code"] as! Int == 200{
                    
                    let dataArray = (result["data"] as! [String: Any])["items"] as! [AnyObject]
                    
                    self.dataSource = dataArray.map({ (item) -> SimpleModel in
                        let model: SimpleModel = SimpleModel()
                        model.mj_setKeyValues(item["data"] as Dictionary)
                        
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
