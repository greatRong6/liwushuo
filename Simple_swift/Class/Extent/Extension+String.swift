//
//  Extension+String.swift
//  Tracekeep
//
//  Created by 卢梦如 on 2017/11/26.
//  Copyright © 2017年 Mengru Lu. All rights reserved.
//  扩展String
//

import UIKit

extension String {
    
    // 数字（可包含两位小数）
    func isPriceNumber() -> Bool {
        
        let priceNumber:String = "^(?!0\\d)\\d+(\\.\\d{1,2})?$";
        let regextestmobile:NSPredicate = NSPredicate(format: "SELF MATCHES %@", priceNumber)
        return regextestmobile.evaluate(with: self)
        
    }
    
    // 获取字符串的高度
    func getTextHeight(font:CGFloat,width:CGFloat) -> CGFloat {
        
        let normalText = self as NSString
        let size = CGSize(width: width, height: CGFloat(MAXFLOAT))
        let fontS = UIFont.systemFont(ofSize: font)
        let dic = NSDictionary(object: fontS, forKey: NSAttributedStringKey.font as NSCopying)
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedStringKey : Any], context:nil).size
        return stringSize.height
        
    }
    
    
    // 获取字符串的长度
    func getTexWidth(font:CGFloat,height:CGFloat) -> CGFloat {
        
        let normalText: NSString = self as NSString
        let size = CGSize(width: CGFloat(MAXFLOAT), height: height)
        let fontS = UIFont.systemFont(ofSize: font)
        let dic = NSDictionary(object: fontS, forKey: NSAttributedStringKey.font as NSCopying)
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedStringKey : Any], context:nil).size
        return stringSize.width
        
    }
    
    // MD5 加密
    var md5 : String{
        
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        
        for i in 0 ..< digestLen {
            
            hash.appendFormat("%02x", result[i])
            
        }
        result.deinitialize()
        return String(format: hash as String)
        
    }
    
    
    // 隐藏手机号
    var hideIphoneNumber: String{
        
        let phone = self as NSString
        return phone.substring(with: NSRange(location: 0, length: 3)) + "****" + phone.substring(with: NSRange(location: phone.length - 4, length: 4))
        
    }
    
    // 隐藏银行卡号 身份证号
    var hideIdNumber: String{
        
        let phone = self as NSString
        return phone.substring(with: NSRange(location: 0, length: 4)) + "****" + phone.substring(with: NSRange(location: phone.length - 4, length: 4))

    }
    
    // 汉字转拼音
    func transformToPinYin() -> String {
        
        let mutableString = NSMutableString(string: self)
        //把汉字转为拼音
        CFStringTransform(mutableString, nil, kCFStringTransformToLatin, false)
        //去掉拼音的音标
        CFStringTransform(mutableString, nil, kCFStringTransformStripDiacritics, false)
        
        let string = String(mutableString)
        //去掉空格
        return string.replacingOccurrences(of: " ", with: "")
        
    }
 
}


