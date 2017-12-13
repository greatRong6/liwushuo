//
//  Extension+UIView.swift
//  Tracekeep
//
//  Created by 卢梦如 on 2017/11/26.
//  Copyright © 2017年 Mengru Lu. All rights reserved.
//  扩展UIView
//

import UIKit

extension UIView {
    
    // 获取view左边的坐标
    var left: CGFloat {
        
        get{
            return self.frame.origin.x
        }
        set{
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
        
    }
    
    // 获取view右边的坐标
    var right: CGFloat {
        
        get{
            return self.frame.origin.x + self.frame.size.width
        }
        set{
            var frame = self.frame
            frame.origin.x = newValue - frame.size.width
            self.frame = frame
        }
        
    }
    
    // 获取view上边的坐标
    var top: CGFloat {
        
        get{
            return self.frame.origin.y
        }
        set{
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
        
    }
    
    // 获取view下边的坐标
    var bottom: CGFloat {
        
        get{
            return self.frame.origin.y + self.frame.size.height
        }
        set{
            var frame = self.frame
            frame.origin.y = newValue - frame.size.height
            self.frame = frame
        }
        
    }
    
    // 获取view的x轴的中心点
    var centerX: CGFloat {
        
        get{
            return self.center.x
        }
        set{
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
        
    }
    
    // 获取view的y轴的中心点
    var centerY: CGFloat {
        
        get{
            return self.center.y
        }
        set{
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
        
    }
    
    // 获取view的宽度
    var width: CGFloat {
        
        get{
            return self.frame.size.width
        }
        set{
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
        
    }
    
    // 获取view的高度
    var height: CGFloat {
        
        get{
            return self.frame.size.height
        }
        set{
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
        
    }
    
    // 获取view的size
    var size: CGSize {
        
        get{
            return self.frame.size
        }
        set{
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
        
    }
    
}
