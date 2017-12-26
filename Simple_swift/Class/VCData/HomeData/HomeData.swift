//
//  HomeData.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/21.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

class HomeData: NSObject {
    
    static let shareNetwork = HomeData()
    var dataArray: [HomeModel] = []
    var titleArray: [TopModel] = []
    
    var pageNum:Int = 0
    var pageSize:Int = 10
    var home_Url:String = ""
    
    func loadHomeTopData(callBlock: @escaping (Bool) -> Void){
        let params = [
            "gender": "1",
            "generation": "1",
            ] as [String : Any]
        weak var weakSelf = self
        BQHttpTool.request(method: .get, url: Home_TitleUrl, parameters: params as NSDictionary) { ( result : AnyObject, error: Error?) in
            if error == nil{
                print(result)
                if result["code"] as! Int == 200{
                    
                    let dataArray = (result["data"] as! [String: Any])["candidates"] as! [AnyObject]
//                    weakSelf?.titleArray = TopModel.mj_setKeyValues(dataArray) as [TopModel]
                    
                    weakSelf?.titleArray = dataArray.map({ (item: AnyObject) -> TopModel in
                        
                        let homeModel: TopModel = TopModel()
                        homeModel.name = item["name"] as! String
                        homeModel.typeId = item["id"] as! Int
                        return homeModel
                    })
                    callBlock(true)
                    
                }
            }else{
                callBlock(false)
            }
        }
    }
    
    func loadProductData(callBlock: @escaping (Bool) -> Void){
        
        let params = [
            "gender": 1,
            "generation": 1,
            "limit": String(self.pageSize),
            "offset": String(self.pageNum)
            ] as [String : Any]
                
        BQHttpTool.request(method: .get, url: home_Url, parameters: params as NSDictionary) { ( result : AnyObject, error: Error?) in
            if error == nil{
                print(result)
                if result["code"] as! Int == 200{
                    
                    let array = (result["data"] as! [String: Any])["items"] as! [AnyObject]
                                        
                    //self.dataA = SimpleModel.mj_objectArray(withKeyValuesArray: dataArray) as! [SimpleModel]
                    
                    self.dataArray = array.map({ (item) -> HomeModel in
                        
                        let model: HomeModel = HomeModel()
                        model.short_title = item["short_title"] as! String
                        model.cover_image_url = item["cover_image_url"] as! String

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
