//
//  WYDefineMarco.swift
//  Simple_swift
//
//  Created by greatRong on 2017/12/7.
//  Copyright © 2017年 gezhenrong. All rights reserved.
//

import UIKit

let DEF_SCREEN_WIDTH = UIScreen.main.bounds.size.width

let DEF_SCREEN_HEIGHT = UIScreen.main.bounds.size.height

let isIPhone5 = DEF_SCREEN_HEIGHT == 568 ? true : false

let isIPhone6 = DEF_SCREEN_HEIGHT == 667 ? true : false

let isIPhone6P = DEF_SCREEN_HEIGHT == 736 ? true : false

let isIPhoneX = DEF_SCREEN_HEIGHT == 812 ?  true : false

func RGB(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
}

func RGBA(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

func DefauleColor () -> UIColor{
    return RGBA(r: 245, g: 80, b: 83, a: 1)
}

func kIS_IOS7() ->Bool { return (UIDevice.current.systemVersion as NSString).doubleValue >= 7.0 }
func kIS_IOS8() -> Bool { return (UIDevice.current.systemVersion as NSString).doubleValue >= 8.0 }

let KNavigaHeight = isIPhoneX ? 88 : 64
let KTabarHeight = isIPhoneX ? 83 : 49

func LoadCellClass(view: UITableView, className: AnyClass, name: String){
    return view.register(className.self, forCellReuseIdentifier: name)
}

func LoadNibCellClass(view: UITableView, name: String){
    return view.register(UINib.init(nibName: name, bundle: Bundle.main), forCellReuseIdentifier: name)
}

func LoadCollectionCellClass(view: UICollectionView, className: AnyClass, name: String){
    return view.register(className.self, forCellWithReuseIdentifier: name)
}

func LoadCollectNibCellClass(view: UICollectionView, name: String){
    return view.register(UINib.init(nibName: name, bundle: Bundle.main), forCellWithReuseIdentifier: name)
}

func String_Size(s:String, w:CGFloat,h: CGFloat, f: CGFloat) -> CGSize{
    return s.boundingRect(with: CGSize(width: w,height: h), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 14)], context: nil).size
}







