//
//  ContentData.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/29.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

class ContentData: NSObject {

    static let shareNetwork = ContentData()
    
    var dataArray: [CategoryModel] = []
    var partArray: [PostsModel] = []
    var limit:Int = 0
    var styleId:Int = 0
    var requestUrl:String = ""
    
    
    //专题
    func loadCollectionsPosts(callBlock: @escaping (Bool) -> Void){
        
        weak var weakSelf = self
        
        let params = ["gender": 1,
                      "generation": 1,
                      "limit": 20,
                      "offset": 0]
        
        BQHttpTool.request(method: .get, url: requestUrl, parameters: params as NSDictionary) { ( result : AnyObject, error: Error?) in
            if error == nil{
                if result["code"] as! Int == 200{
                    
                    let partArr = (result["data"] as! [String: Any])["posts"] as! [AnyObject]
                    
                    weakSelf?.partArray = partArr.map({ (item: AnyObject) -> PostsModel in
                        
                            let postsModel: PostsModel = PostsModel()
                            postsModel.title = item["title"] as! String
                            postsModel.cover_image_url = item["cover_image_url"] as! String
                            postsModel.content_url = item["content_url"] as! String
                            postsModel.group_id = item["id"] as! Int
                            return postsModel
                        
                    })
                    callBlock(true)
                    
                }
            }else{
                callBlock(false)
            }
        }
    }


    //风格  品类
    func loadCategoryGroup(callBlock: @escaping (Bool) -> Void){
        
        weak var weakSelf = self
        BQHttpTool.request(method: .get, url: Category_Url, parameters: nil) { ( result : AnyObject, error: Error?) in
            if error == nil{

                if result["code"] as! Int == 200{
                    
                    let dataArray = (result["data"] as! [String: Any])["channel_groups"] as! [AnyObject]
                    
                    weakSelf?.dataArray = dataArray.map({ (item: AnyObject) -> CategoryModel in

                        let homeModel: CategoryModel = CategoryModel()
                        
                        homeModel.name = item["name"] as! String
                        homeModel.cataId = item["id"] as! Int
                        
                        let channels: [AnyObject] = item["channels"] as! [AnyObject]

                        homeModel.channels = channels.map({ (item: AnyObject) -> ChannelsModel in
                            
                            let channelModel: ChannelsModel = ChannelsModel()
                            channelModel.name = item["name"] as! String
                            channelModel.icon_url = item["icon_url"] as! String
                            channelModel.group_id = item["group_id"] as! Int
                            return channelModel
                            
                        })
                        return homeModel
                        
                    })
                    callBlock(true)
                    
                }
            }else{
                callBlock(false)
            }
        }
    }
    //专题   查看全部
    func loadCollectionsLookAll(callBlock: @escaping (Bool) -> Void){
        
        weak var weakSelf = self
        
        let params = ["limit": limit,
                      "offset": 0]

        BQHttpTool.request(method: .get, url: CollectionsLookAll_Url, parameters: params as NSDictionary) { ( result : AnyObject, error: Error?) in
            if error == nil{

                if result["code"] as! Int == 200{
                    
                    let partArr = (result["data"] as! [String: Any])["collections"] as! [AnyObject]
                    
                    weakSelf?.partArray = partArr.map({ (item: AnyObject) -> PostsModel in
                        
                        let postsModel: PostsModel = PostsModel()
                        postsModel.title = item["title"] as! String
                        postsModel.cover_image_url = item["cover_image_url"] as! String
                        postsModel.banner_image_url = item["banner_image_url"] as! String
                        postsModel.subtitle = item["subtitle"] as! String
                        
                        return postsModel

                    })
                    callBlock(true)
                    
                }
            }else{
                callBlock(false)
            }
        }
    }

    //风格品类  列表
    func loadStylesOrCategory(callBlock: @escaping (Bool) -> Void){
        
        weak var weakSelf = self
        
        let params = ["limit": 20,
                      "offset": 0]

        BQHttpTool.request(method: .get, url: requestUrl, parameters: params as NSDictionary) { ( result : AnyObject, error: Error?) in
            if error == nil{
                
                if result["code"] as! Int == 200{
                    
                    let partArr = (result["data"] as! [String: Any])["collections"] as! [AnyObject]
                    
                    weakSelf?.partArray = partArr.map({ (item: AnyObject) -> PostsModel in
                        
                        let postsModel: PostsModel = PostsModel()
                        postsModel.title = item["title"] as! String
                        postsModel.cover_image_url = item["cover_image_url"] as! String
                        postsModel.content_url = item["content_url"] as! String
                        postsModel.short_title = item["short_title"] as! String
                        
                        return postsModel
                        
                    })
                    callBlock(true)
                    
                }
            }else{
                callBlock(false)
            }
        }
    }

}
