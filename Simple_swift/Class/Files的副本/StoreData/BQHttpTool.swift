//
//  BQHttpTool.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/13.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit
import Alamofire
import SystemConfiguration

// 网络请求超时时间 
let NetworkTimeoutInterval:Double = 30

class BQHttpTool: NSObject {
    
    static let sharedInstance = BQHttpTool()
    private override init() {}
    var viewController:UIViewController?
    
    static var sessionManager:SessionManager? = nil
    
    class func modelWithViewController(viewController:UIViewController) -> AnyObject{
        
        let model:BQHttpTool = BQHttpTool.init()
        if model == nil {
            model.viewController = viewController
        }
        return model
        
    }
    
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
            
            if self.connectedToNetwork(){
                
                
                
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
                
            }else{
                ProgressHUD.showError("请求失败")
                print("接口请求失败 \(url)")
            }
        }
    }
    
    class func connectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }

}
