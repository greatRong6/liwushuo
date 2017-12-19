//
//  Extension+AlterView.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/8.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

enum GZRAlertType {
    case GZRAlertStyleAlert
    case GZRAlertStyleActionSheet
}

extension UIAlertController{
    
    class func showAlert( _ alertTitle:String, _ messsage: String, _ viewController: UIViewController){
        let alertController = UIAlertController.init(title: alertTitle, message: messsage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction.init(title: "确定", style: .cancel, handler: { (action) in
            print("点击了取消")
        }))
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    class func showAlertView(_ alertTitle: String, _ messsage: String, _ style: GZRAlertType, _ cancleTitle:String, _ otherArr: Array<Any>, _ viewController: UIViewController, complete: @escaping(_ result : AnyObject) -> Void){
        
        if style == .GZRAlertStyleAlert {
            
            let alertController = UIAlertController.init(title: alertTitle, message: messsage, preferredStyle: .alert)
            alertController.addAction(UIAlertAction.init(title: cancleTitle, style: .cancel, handler: { (action) in
                print("点击了取消")
            }))
            for index in 0...otherArr.count - 1{
                alertController.addAction(UIAlertAction.init(title: otherArr[index] as? String, style: .default, handler: { (action) in
                    print("点击 \(index)")
                    complete(index  as AnyObject)
                }))
            }
            viewController.present(alertController, animated: true, completion: nil)
            
        }else{
            
            let alertController = UIAlertController.init(title: alertTitle, message: messsage, preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction.init(title: cancleTitle, style: .cancel, handler: { (action) in
                print("点击了取消")
            }))
            for index in 0...otherArr.count - 1 {
                alertController.addAction(UIAlertAction.init(title: otherArr[index] as? String, style: .destructive, handler: { (action) in
                    print("点击 \(index)")
                    complete(index  as AnyObject)
                }))
            }
            viewController.present(alertController, animated: true, completion: nil)
            
        }
    }
    
    class func showAlertTextFView(_ alertTitle: String, _ messsage: String, _ style: GZRAlertType, _ cancleTitle:String, _ viewController: UIViewController, complete: @escaping(_ result : AnyObject) -> Void){
        
        let alertController = UIAlertController.init(title: alertTitle, message: messsage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction.init(title: cancleTitle, style: .cancel, handler: { (action) in
            print("点击了取消")
        }))
        alertController.addAction(UIAlertAction.init(title: "确定", style: .default, handler: { (action) in
            print("点击确定")
        }))
        alertController.addTextField { (textF) in
            textF.placeholder = "请填入信息"
            complete(textF.text as AnyObject)
        }
        viewController.present(alertController, animated: true, completion: nil)
        
    }
}
