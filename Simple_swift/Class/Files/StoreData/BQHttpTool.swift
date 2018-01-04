//
//  BQHttpTool.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/13.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit
import Alamofire

// 网络请求超时时间
let NetworkTimeoutInterval:Double = 30

class BQHttpTool: NSObject {
    
    static let sharedInstance = BQHttpTool()
    private override init() {}
    
    static var sessionManager:SessionManager? = nil
    
    class func request(method:HTTPMethod, url:String, parameters:NSDictionary?, finishedCallback:  @escaping (_ result : AnyObject, _ error: Error?) -> ()){
        let config:URLSessionConfiguration = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = NetworkTimeoutInterval
        sessionManager = SessionManager(configuration: config)
        ProgressHUD.show("正在加载...", interaction: false)
        
        print("请求Url：\(url)")
        
        if parameters != nil {
            print("参数：\(parameters as! Parameters)")
        }else{
            print("无参数")
        }

        Alamofire.request(url, method: method, parameters: parameters as? Parameters, encoding: URLEncoding.default).responseJSON { (response) in
            ProgressHUD.dismiss()
            
            if (response.result.isSuccess)
            {
                let value: [String: AnyObject] = (response.result.value as? [String : AnyObject])!
                print("返回数据：\(value)")
                finishedCallback(value as AnyObject, nil)
            }
            else
            {
                ProgressHUD.showError("请求失败")
                print("接口请求失败 \(url)")
            }
        }
    }
}
