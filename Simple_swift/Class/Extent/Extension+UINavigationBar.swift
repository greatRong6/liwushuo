//
//  Extension+UINavigationBar.swift
//  Simple_swift
//
//  Created by iosdev on 2017/12/11.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func imageWithColor(_ color : UIColor) -> UIImage {
        let rect = CGRect(x: 0,y: 0,width: 1,height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func setNavigationBarWithColor(_ color:UIColor){
        let image = self.imageWithColor(color)
        self.setBackgroundImage(image, for: .default)
        self.barStyle = .default
        self.shadowImage = UIImage.init()
        self.tintColor = UIColor.white
    }
    
}
