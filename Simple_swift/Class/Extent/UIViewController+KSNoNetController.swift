//
//  UIViewController+KSNoNetController.swift
//  Simple_swift
//
//  Created by iosdev on 2018/1/24.
//  Copyright © 2018年 gezhenrong. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showNoneWork(){
        
        let netView = Bundle.main.loadNibNamed("KSNoNetView", owner: nil, options: nil)?.first as! KSNoNetView
        netView.frame = CGRect(x: 0,y: 0,width: DEF_SCREEN_WIDTH,height: DEF_SCREEN_HEIGHT)
        netView.moreButtonBlock = {(button) in
            self.perform(#selector(self.reloadNetworkDataSource), with: button)
        }
        self.view.addSubview(netView)
        
    }
    
    func showHiddenNetWork(){
        for view in self.view.subviews{
            if view is KSNoNetView{
                view.removeFromSuperview()
            }
        }
    }
    
    @objc func reloadNetworkDataSource(){
        if self.responds(to: #selector(reloadRequest)) {
            self.perform(#selector(reloadRequest))
        }
    }
    
    @objc func reloadRequest(){
        print("必须由网络控制器(\(NSStringFromClass(self.superclass!))重写这个方法(\(NSStringFromSelector(#selector(reloadRequest)))，才可以使用再次刷新网络")
    }
    
}
