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
    var bannerArray: [HomePicModel] = []
    var buttonArray: [HomeButtonModel] = []
    var picArray: [String] = []
    var cateModel:StrategyModel = StrategyModel()
    
    var pageNum:Int = 0
    var pageSize:Int = 10
    var home_Url:String = ""
    
    func loadBannerPic(callBlock: @escaping (Bool) -> Void){
        
        let params = Dictionary<String,String>()

        BQHttpTool.request(method: .get, url: Banners_Url, parameters: params as NSDictionary) { ( result : AnyObject, error: Error?) in
            if error == nil{
                
                self.bannerArray.removeAll()
                self.picArray.removeAll()

                if result["code"] as! Int == 200{
                    let dataArray = (result["data"] as! [String: Any])["banners"] as! [AnyObject]
                    self.bannerArray = dataArray.map({ (item: AnyObject) -> HomePicModel in
                        let bannerModel: HomePicModel = HomePicModel()
                        bannerModel.mj_setKeyValues(item)
                        self.picArray.append(bannerModel.image_url)
                        return bannerModel
                    })
                }
                callBlock(true)

            }else{
                callBlock(false)
            }
        }
    }
    
    func loadBannerButton(callBlock: @escaping (Bool) -> Void){
        
        let params = Dictionary<String,String>()
        
        BQHttpTool.request(method: .get, url: BanBtn_Url, parameters: params as NSDictionary) { ( result : AnyObject, error: Error?) in
            if error == nil{
                
                self.buttonArray.removeAll()
                
                if result["code"] as! Int == 200{
                    let dataArray = (result["data"] as! [String: Any])["promotions"] as! [AnyObject]
                    self.buttonArray = dataArray.map({ (item: AnyObject) -> HomeButtonModel in
                        let buttonArray: HomeButtonModel = HomeButtonModel()
                        buttonArray.mj_setKeyValues(item)
                        return buttonArray
                    })
                }
                callBlock(true)
                
            }else{
                callBlock(false)
            }
        }
        
    }

    
    func loadHomeTopData(callBlock: @escaping (Bool) -> Void){
        
        let params = [
            "gender": "1",
            "generation": "1",
            ] as [String : Any]
        
        weak var weakSelf = self
        
        BQHttpTool.request(method: .get, url: Home_TitleUrl, parameters: params as NSDictionary) { ( result : AnyObject, error: Error?) in
            if error == nil{

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

                if result["code"] as! Int == 200{
                    
                    let array = (result["data"] as! [String: Any])["items"] as! [AnyObject]
                                        
                    //self.dataA = SimpleModel.mj_objectArray(withKeyValuesArray: dataArray) as! [SimpleModel]
                    
                    self.dataArray = array.map({ (item) -> HomeModel in
                        
                        let model: HomeModel = HomeModel()
                        model.mj_setKeyValues(item)
//                        model.short_title = item["short_title"] as! String
//                        model.cover_image_url = item["cover_image_url"] as! String

                        return model
                    })
                    callBlock(true)
                }
            }else{
                callBlock(false)
            }
        }
    }
    
    func loadCategoriesData(callBlock: @escaping (Bool) -> Void){
        
        let params = [
            :
            ] as [String : Any]
        
        BQHttpTool.request(method: .get, url: Categories_Url, parameters: params as NSDictionary) { ( result : AnyObject, error: Error?) in
            if error == nil{
                
                self.cateModel = StrategyModel.mj_object(withKeyValues: result)
                if(self.cateModel.code == "200"){
                    
                }
                
            }else{
                callBlock(false)
            }
        }
    }

}
